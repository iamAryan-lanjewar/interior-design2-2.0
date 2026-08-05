param(
    [int]$Port = 8080
)

$listener = New-Object System.Net.HttpListener
$prefix = "http://localhost:$Port/"
$listener.Prefixes.Add($prefix)

try {
    $listener.Start()
    Write-Host "=================================================="
    Write-Host " Local server running at: $prefix"
    Write-Host " Open your browser to: $prefix"
    Write-Host "=================================================="
} catch {
    Write-Host "Failed to start listener on port $Port : $_"
    exit 1
}

$rootDir = (Get-Item -Path ".").FullName

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $rawPath = $request.Url.AbsolutePath
        $decodedPath = [System.Net.WebUtility]::UrlDecode($rawPath)
        
        if ($decodedPath -eq "/" -or [string]::IsNullOrWhiteSpace($decodedPath)) {
            $decodedPath = "/index.html"
        }

        $relativePath = $decodedPath.TrimStart('/').Replace('/', [System.IO.Path]::DirectorySeparatorChar)
        $filePath = [System.IO.Path]::Combine($rootDir, $relativePath)

        if (Test-Path $filePath -PathType Container) {
            $filePath = [System.IO.Path]::Combine($filePath, "index.html")
        }

        if (Test-Path $filePath -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()

            $contentType = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".htm"  { "text/html; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".js"   { "application/javascript; charset=utf-8" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".gif"  { "image/gif" }
                ".svg"  { "image/svg+xml" }
                ".webp" { "image/webp" }
                ".ico"  { "image/x-icon" }
                ".pdf"  { "application/pdf" }
                ".json" { "application/json" }
                ".woff" { "font/woff" }
                ".woff2"{ "font/woff2" }
                ".ttf"  { "font/ttf" }
                Default { "application/octet-stream" }
            }

            # Security & Anti-Cache Response Headers
            $response.Headers.Add("X-Frame-Options", "SAMEORIGIN")
            $response.Headers.Add("X-Content-Type-Options", "nosniff")
            $response.Headers.Add("Referrer-Policy", "strict-origin-when-cross-origin")
            $response.Headers.Add("Content-Security-Policy", "default-src 'self'; script-src 'self' 'unsafe-inline' https://unpkg.com https://www.googletagmanager.com; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com https://unpkg.com; font-src 'self' https://fonts.gstatic.com https://unpkg.com; img-src 'self' data: https://images.unsplash.com https://maps.google.com https://maps.gstatic.com https://www.google-analytics.com https://*.doubleclick.net; frame-src 'self' https://maps.google.com https://www.google.com; connect-src 'self' https://www.google-analytics.com https://*.google-analytics.com https://*.analytics.google.com;")
            $response.Headers.Add("Permissions-Policy", "geolocation=(), camera=(), microphone=()")
            $response.Headers.Add("Cache-Control", "no-cache, no-store, must-revalidate")
            $response.Headers.Add("Pragma", "no-cache")
            $response.Headers.Add("Expires", "0")

            $response.ContentType = $contentType
            $response.ContentLength64 = $bytes.Length
            $response.StatusCode = 200
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            # Security Response Headers
            $response.Headers.Add("X-Frame-Options", "SAMEORIGIN")
            $response.Headers.Add("X-Content-Type-Options", "nosniff")
            $response.Headers.Add("Referrer-Policy", "strict-origin-when-cross-origin")
            $response.Headers.Add("Content-Security-Policy", "default-src 'self'; script-src 'self' 'unsafe-inline' https://unpkg.com https://www.googletagmanager.com; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com https://unpkg.com; font-src 'self' https://fonts.gstatic.com https://unpkg.com; img-src 'self' data: https://images.unsplash.com https://maps.google.com https://maps.gstatic.com https://www.google-analytics.com https://*.doubleclick.net; frame-src 'self' https://maps.google.com https://www.google.com; connect-src 'self' https://www.google-analytics.com https://*.google-analytics.com https://*.analytics.google.com;")
            $response.Headers.Add("Permissions-Policy", "geolocation=(), camera=(), microphone=()")

            $response.StatusCode = 404
            $notFoundBytes = [System.Text.Encoding]::UTF8.GetBytes("<h1>404 Not Found</h1><p>File not found: $decodedPath</p>")
            $response.ContentType = "text/html; charset=utf-8"
            $response.ContentLength64 = $notFoundBytes.Length
            $response.OutputStream.Write($notFoundBytes, 0, $notFoundBytes.Length)
        }
        $response.Close()
    } catch {
        # Keep listener alive if individual request fails
    }
}
