$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

# CSS Styling matching the original PDFs
$css = @"
<style>
    @page { size: A4; margin: 15mm 15mm 15mm 15mm; }
    body { font-family: 'Segoe UI', Arial, sans-serif; color: #222; font-size: 10.5pt; line-height: 1.5; margin: 0; padding: 0; }
    .header-banner { background-color: #0f2b5c; color: white; padding: 20px 25px; border-radius: 4px; margin-bottom: 25px; }
    .header-banner h1 { font-size: 22pt; margin: 0 0 5px 0; text-transform: uppercase; letter-spacing: 1px; font-weight: 700; }
    .header-banner p { font-size: 9.5pt; margin: 0; text-transform: uppercase; letter-spacing: 0.8px; opacity: 0.9; }
    h2.doc-title { font-size: 18pt; color: #0f2b5c; margin: 0 0 6px 0; font-weight: 700; }
    .doc-subtitle { font-size: 11pt; color: #555; margin-bottom: 25px; border-bottom: 1px solid #ddd; padding-bottom: 15px; }
    h3.section-heading { font-size: 12.5pt; color: #0f2b5c; margin: 22px 0 10px 0; border-left: 4px solid #0f2b5c; padding-left: 10px; font-weight: 700; page-break-after: avoid; }
    p { margin: 0 0 12px 0; text-align: justify; }
    .metric-grid { display: flex; justify-content: space-between; gap: 10px; margin: 18px 0; }
    .metric-card { flex: 1; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 4px; padding: 12px; text-align: center; }
    .metric-num { font-size: 15pt; font-weight: 700; color: #0f2b5c; margin-bottom: 4px; }
    .metric-label { font-size: 8pt; font-weight: 700; text-transform: uppercase; color: #475569; }
    table { width: 100%; border-collapse: collapse; margin: 18px 0; font-size: 9.5pt; page-break-inside: avoid; }
    th { background-color: #0f2b5c; color: white; text-align: left; padding: 8px 10px; font-weight: 600; }
    td { padding: 8px 10px; border-bottom: 1px solid #e2e8f0; vertical-align: top; }
    tr:nth-child(even) td { background-color: #f8fafc; }
    .callout-box { background-color: #f0fdf4; border-left: 4px solid #16a34a; padding: 12px 15px; margin: 18px 0; border-radius: 0 4px 4px 0; }
    .callout-title { font-weight: 700; color: #15803d; margin-bottom: 4px; }
    .hazard-box { background-color: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 15px; margin: 18px 0; border-radius: 0 4px 4px 0; }
    .hazard-title { font-weight: 700; color: #b91c1c; margin-bottom: 4px; }
    .footer { font-size: 8.5pt; color: #64748b; border-top: 1px solid #e2e8f0; padding-top: 12px; margin-top: 30px; display: flex; justify-content: space-between; }
    .page-break { page-break-before: always; }
    ul { margin: 0 0 12px 20px; padding: 0; }
    li { margin-bottom: 6px; }
</style>
"@

# Guide 1 HTML
$g1_html = @"
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">$css</head>
<body>
    <div class="header-banner">
        <h1>Asha Interiors</h1>
        <p>PREMIUM TURNKEY HOME INTERIORS & LUXURY COMMERCIAL SPACES</p>
    </div>
    <h2 class="doc-title">The Honest Budget Guide: Zero-Escalation Protocol</h2>
    <div class="doc-subtitle">How We Lock Your Interior Costs & Save You From Hidden Extra Charges</div>

    <h3 class="section-heading">1. Introduction: Why Do Interior Budgets Go Up?</h3>
    <p>When planning a new house interior design, the biggest fear for any homeowner is budget escalation. Many times, you start with a budget of 10 Lakhs, but by the time the work finishes, the final bill reaches 13 Lakhs or 14 Lakhs. This happens because of hidden costs, lack of clear planning, and sudden "extra item" charges added by contractors in the middle of the work.</p>
    <p>At <strong>Asha Interiors</strong>, we don't believe in giving low fake estimates just to sign the client. We want to educate you before you spend your hard-earned money. This handbook breaks down every single small component of your interior budget so you can plan everything perfectly with zero surprise expenses later.</p>

    <h3 class="section-heading">2. The Standard 4-Part Structure of a Complete Budget</h3>
    <p>A professional, premium interior design budget is divided into four main parts. If your designer or carpenter is only talking about plywood and laminate costs, they are missing the bigger picture! Here is how your total budget is distributed:</p>
    
    <div class="metric-grid">
        <div class="metric-card"><div class="metric-num">35% - 45%</div><div class="metric-label">CIVIL & FIXED WORK</div></div>
        <div class="metric-card"><div class="metric-num">30% - 40%</div><div class="metric-label">FURNITURE & FF&E</div></div>
        <div class="metric-card"><div class="metric-num">10% - 15%</div><div class="metric-label">DESIGN & FEES</div></div>
        <div class="metric-card"><div class="metric-num">10% - 15%</div><div class="metric-label">SAFE CONTINGENCY</div></div>
    </div>

    <ul>
        <li><strong>Civil & Fit-out (Hard Costs):</strong> Includes raw material and structural changes like breaking walls, plastering, POP false ceiling, tile flooring, main electrical wiring, and plumbing.</li>
        <li><strong>Furniture & Decor (FF&E):</strong> Includes modular kitchen, wardrobes, sofa sets, dining tables, chairs, mattresses, curtains, and decorative lights.</li>
        <li><strong>Soft Costs / Consultation Fees:</strong> Professional charges for 2D layouts, 3D realistic designs, site supervision, and detailed engineering plans.</li>
        <li><strong>Emergency Buffer Fund:</strong> A small reserve money kept separately for genuine, unforeseen changes.</li>
    </ul>

    <div class="callout-box">
        <div class="callout-title">Asha Interiors Promise:</div>
        Once our detailed quotation is signed, the rate is locked. We do not change material pricing or add hidden charges midway through the construction cycle.
    </div>

    <h3 class="section-heading">3. The Micro-Detailed Checklist: Every Tiny Cost Counted</h3>
    <p>To ensure your project remains on track, we list every micro-item in our initial baseline budget:</p>

    <table>
        <thead>
            <tr><th>Work Category</th><th>Every Tiny Detail Included</th><th>Approx Budget %</th></tr>
        </thead>
        <tbody>
            <tr><td><strong>1. Civil, POP & False Ceiling</strong></td><td>Debris removal, wall chipping, tile flooring layout, POP false ceiling with channels, gypsum boards, trap doors for AC maintenance.</td><td>15% - 20%</td></tr>
            <tr><td><strong>2. Electrical & Smart Wiring</strong></td><td>Heavy-duty copper wires (Finolex/Polycab), modular switchboards, MCB box upgrades, Cat6 cables, LED profile light cutouts.</td><td>12% - 15%</td></tr>
            <tr><td><strong>3. Surface & Wall Finishes</strong></td><td>Wall putty base, primer coats, premium emulsion paints (Asian Paints/Berger), textured finishes, louvers, wallpapers.</td><td>10% - 12%</td></tr>
            <tr><td><strong>4. Custom Cabinetry & Kitchen</strong></td><td>Waterproof BWP plywood base, anti-scratch laminates, soft-close hydraulic hinges, tandem drawers for modular kitchen, profile handles.</td><td>20% - 25%</td></tr>
            <tr><td><strong>5. Loose Furniture & Decor</strong></td><td>Customized high-density foam sofas, fabric upholstery, dining table top, designer headboards, window curtains, Roman blinds.</td><td>18% - 22%</td></tr>
            <tr><td><strong>6. Logistics & Packing</strong></td><td>Factory-to-site safe transportation, bubble wrapping, heavy lifting, unboxing, deep cleaning after construction finishes.</td><td>3% - 5%</td></tr>
            <tr><td><strong>7. Professional Supervision</strong></td><td>Detailed 3D design plans, day-to-day site quality inspection, matching materials at vendor shops, overall project management.</td><td>8% - 10%</td></tr>
        </tbody>
    </table>

    <h3 class="section-heading">4. The Four Reasons Why Interior Budgets Fail (And How We Avoid Them)</h3>
    <div class="hazard-box">
        <div class="hazard-title">REASON 1: SCOPE CREEP (CHOTA-MOTA EXTRA ITEMS)</div>
        During execution, saying "let's add one small drawer here" slowly adds up. To prevent this, <strong>Asha Interiors</strong> provides complete 3D visuals and locks the entire layout before buying even one sheet of plywood.
    </div>

    <p><strong>Reason 2: Hidden Site Conditions (Purana Ghar Problems)</strong><br>In older properties, scraping old walls often reveals seepage or faulty plumbing. We conduct a thorough site audit before finalized budgeting.</p>
    <p><strong>Reason 3: Not Accounting for Material Wastage</strong><br>When cutting tiles or wallpapers, 10% to 15% of material goes to waste. We use automated calculation tools to budget accurate wastage from day one.</p>
    <p><strong>Reason 4: Overlooking Logistics, Transportation & Deep Cleaning</strong><br>Miscellaneous expenses like octroi, loading/unloading, and post-work deep cleaning are included directly in our budget proposal.</p>

    <h3 class="section-heading">5. Asha Interiors' Strategy for Complete Peace of Mind</h3>
    <ul>
        <li><strong>1. Fixed-Rate Material Book:</strong> Comprehensive contract listing exact brand names (CenturyPly, Greenlam, Hafele, Asian Paints). No loose substitution words.</li>
        <li><strong>2. Smart Value Engineering:</strong> Optimization of materials (e.g. premium veneers on external visible panels, durable laminates inside) to lower costs without strength reduction.</li>
        <li><strong>3. Double-Sign Off Verification:</strong> Two-step physical measurement and financial verification check before any material order leaves the factory.</li>
    </ul>

    <h3 class="section-heading">6. Conclusion: A Stress-Free Interior Experience</h3>
    <p>Interior designing your dream home or commercial space should be an exciting journey. Trust <strong>Asha Interiors</strong> to provide an honest, premium, and stress-free turnkey execution.</p>

    <div class="footer">
        <span>Asha Interiors © 2026 | Zero-Escalation Protocol Document</span>
        <span>Page 1 of 1</span>
    </div>
</body>
</html>
"@

# Guide 2 HTML
$g2_html = @"
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">$css</head>
<body>
    <div class="header-banner">
        <h1>Asha Interiors</h1>
        <p>MIDDLE-CLASS BUDGET EXPERTS • NO HIDDEN COSTS • TRANSPARENT EXECUTION</p>
    </div>
    <h2 class="doc-title">The Complete Middle-Class Home Renovation Roadmap</h2>
    <div class="doc-subtitle">A Smart Framework to Plan Your Budget, Stop Price Escalation, and Avoid Local Contractor Traps</div>

    <h3 class="section-heading">1. The Middle-Class Reality: Why Renovation Costs Run Away</h3>
    <p>For an Indian middle-class family, renovating a 2BHK or 3BHK flat is a major emotional and financial milestone. However, statistics show that over 75% of home renovation projects face budget inflation. A project starting with a ₹6 Lakh quote easily crosses ₹8.5 Lakhs.</p>
    <p>At <strong>Asha Interiors</strong>, we have studied these common issues to build a clear, completely transparent zero-escalation checklist specifically designed for budget-conscious homeowners.</p>

    <h3 class="section-heading">2. Budget Architecture: Where Every Rupee is Spent</h3>
    <div class="metric-grid">
        <div class="metric-card"><div class="metric-num">40% - 45%</div><div class="metric-label">CIVIL & STRUCTURAL BASE</div></div>
        <div class="metric-card"><div class="metric-num">35% - 40%</div><div class="metric-label">MODULAR WOODWORK & FF&E</div></div>
        <div class="metric-card"><div class="metric-num">10%</div><div class="metric-label">ELECTRICAL & PLUMBING</div></div>
        <div class="metric-card"><div class="metric-num">10%</div><div class="metric-label">STRICT EMERGENCY BUFFER</div></div>
    </div>

    <h3 class="section-heading">3. Every Tiny Detail: The Micro-Granular Renovation Checklist</h3>
    <table>
        <thead>
            <tr><th>Renovation Area</th><th>Every Tiny Detail Included (Zero Hidden Items)</th><th>Middle-Class Budget Weight</th></tr>
        </thead>
        <tbody>
            <tr><td><strong>1. Civil Work & Flooring</strong></td><td>Old tile chipping, waterproofing, anti-skid floor tiles, kitchen granite replacement, debris disposal via trucks.</td><td>20% - 25%</td></tr>
            <tr><td><strong>2. Electrical & Utility Infrastructure</strong></td><td>Concealed wall cutting (Zari work), FR copper wires (Polycab/Finolex), dedicated modular loops for kitchen appliances, MCB box setup.</td><td>10% - 12%</td></tr>
            <tr><td><strong>3. Walls, Painting & Ceilings</strong></td><td>Anti-fungal treatment on damp areas, 2 coats putty, 1 coat primer, 2 final coats washable acrylic emulsion, localized gypsum ceilings.</td><td>12% - 15%</td></tr>
            <tr><td><strong>4. Kitchen & Modular Wardrobes</strong></td><td>BWP commercial-grade plywood for kitchen carcass, PVC edge-banding, anti-scratch laminates, SS304 soft-close wire baskets, hydraulic lifters.</td><td>25% - 30%</td></tr>
            <tr><td><strong>5. Plumbing & Sanitary Ware</strong></td><td>Replacing leaking CPVC pipelines, installing premium taps, divertors, wall-mounted commodes, under-sink waste coupling, exhaust fans.</td><td>8% - 10%</td></tr>
            <tr><td><strong>6. Doors, Windows & Hardware</strong></td><td>Main door laminate pressing, multi-bolt security locks, water-resistant solid flush doors for bathrooms, magnetic door catchers.</td><td>5% - 7%</td></tr>
            <tr><td><strong>7. Site Handling & Deep Cleaning</strong></td><td>Temporary site protective packing sheets, transport loading/unloading, chemical deep cleaning to remove paint/grout stains before handover.</td><td>3% - 5%</td></tr>
        </tbody>
    </table>

    <div class="hazard-box">
        <div class="hazard-title">TRIGGER 1: THE "LUMP-SUM ESTIMATE" TRAP VS DETAILED BOQ</div>
        Most contractors give vague single-line verbal quotes. <strong>Asha Interiors</strong> destroys this problem by using a detailed Bill of Quantities (BOQ) breaking down every running foot, square foot, and unit cost before taking any advance.
    </div>

    <h3 class="section-heading">4. The Zero-Escalation Strategy for Total Financial Protection</h3>
    <p>To protect our clients' savings, <strong>Asha Interiors</strong> enforces a strict operational protocol: Fixed Brand Binding, Value Engineering for Smart Savings, and a Two-Stage Sign-Off Process.</p>

    <div class="footer">
        <span>Asha Interiors • Middle-Class Home Renovation Master Guide © 2026</span>
        <span>Page 1 of 1</span>
    </div>
</body>
</html>
"@

# Guide 3 HTML
$g3_html = @"
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">$css</head>
<body>
    <div class="header-banner">
        <h1>Asha Interiors</h1>
        <p>THE SCIENTIFIC MEASUREMENT STANDARD • ZERO GUESSWORK • VERIFIED COST CONTROL</p>
    </div>
    <h2 class="doc-title">The Master On-Site Measurement & Audit Guide</h2>
    <div class="doc-subtitle">How Scientific Tape Measurements Stop Vendor Cheating, Prevent Material Wastage, and Lock Final Quotations</div>

    <h3 class="section-heading">1. The Real Reason for Budget Spirals: Measuring Mistakes</h3>
    <p>When Indian families decide to renovate, hidden budget spirals are caused by wrong, inaccurate initial measurements. Most local contractors take generic tape measurements. Later, when modular units arrive, they don't fit, causing sudden "extra item" bills and rough on-site hacking.</p>
    <p>This transparent handbook, built for the <strong>Asha Interiors</strong> digital education portal, empowers you with formulas to audit your site dimensions like a professional engineer.</p>

    <h3 class="section-heading">2. The Core Parameters of Spatial Planning</h3>
    <div class="metric-grid">
        <div class="metric-card"><div class="metric-num">Floor Baseline</div><div class="metric-label">CAPTURES SKIRTING ANOMALIES & FLOOR TILING VARIATIONS</div></div>
        <div class="metric-card"><div class="metric-num">Mid-Wall Baseline</div><div class="metric-label">CALCULATES SWITCHBOARD LOCATIONS & COUNTERTOP ALIGNMENT</div></div>
        <div class="metric-card"><div class="metric-num">Ceiling Baseline</div><div class="metric-label">TRACKS COLUMN BEAM DROPS & FALSE CEILING HEIGHTS</div></div>
    </div>

    <h3 class="section-heading">3. The On-Site Measurement Template Checklist</h3>
    <table>
        <thead>
            <tr><th>Structural Zone</th><th>Every Tiny Detail to Record</th><th>Target Metric Format</th></tr>
        </thead>
        <tbody>
            <tr><td><strong>1. Pure Clear Wall Dimensions</strong></td><td>Measure wall-to-wall distances at three heights (Bottom, Center, Top). Check perpendicularity using a right-angle tool (Guniya check).</td><td>mm / inches</td></tr>
            <tr><td><strong>2. Openings & Clearances</strong></td><td>Door frame outer-to-outer width; window sill height; lintel levels; door swing radius.</td><td>mm / inches</td></tr>
            <tr><td><strong>3. Beam & Column Obstructions</strong></td><td>Exact beam drop depth; column projection thickness from main wall face.</td><td>mm / inches</td></tr>
            <tr><td><strong>4. Plumbing Infrastructure</strong></td><td>Inlet/outlet pipe centers; water source trap coordinates; drain pipe line projection angles.</td><td>mm from corner</td></tr>
            <tr><td><strong>5. Legacy Electrical Points</strong></td><td>Locations of primary distribution boxes, active junction boxes, existing conduit paths.</td><td>mm (X & Y Axis)</td></tr>
            <tr><td><strong>6. Appliance & Ventilation Zones</strong></td><td>Exhaust fan duct circumference; chimney outlet pipe path; external AC copper wire routes.</td><td>Diameter & mm</td></tr>
            <tr><td><strong>7. Floor Levels & Skirting</strong></td><td>Total floor-to-roof clear height across four corners; existing granite floor skirting height.</td><td>mm / inches</td></tr>
        </tbody>
    </table>

    <div class="callout-box">
        <div class="callout-title">The Asha Interiors Standard Rule:</div>
        We mandate all official site measurements to be recorded strictly in millimeters (mm) rather than loose feet and inches to eliminate rounding error gaps during assembly.
    </div>

    <h3 class="section-heading">4. Real-World Pitfalls & Strategic Control Framework</h3>
    <p><strong>Asha Interiors</strong> implements Laser-Guided Verification (+/- 1mm accuracy), As-Built Digital Matching over floor plans, and Pre-Production BOQ Sign-Off so your budget is preserved exactly as promised.</p>

    <div class="footer">
        <span>Asha Interiors • On-Site Measurement & Cost-Locking Protocol © 2026</span>
        <span>Page 1 of 1</span>
    </div>
</body>
</html>
"@

# Guide 4 HTML
$g4_html = @"
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">$css</head>
<body>
    <div class="header-banner">
        <h1>Asha Interiors</h1>
        <p>THE ERGONOMIC STANDARD • GOLDEN RATIO LAYOUTS • HONEST CLIENT EDUCATION</p>
    </div>
    <h2 class="doc-title">The Real-Fact Furniture Dimension & Space Selection Protocol</h2>
    <div class="doc-subtitle">How Anthropometric Layout Rules Prevent Layout Choking, Block Vendor Cheating, and Protect Your Budget</div>

    <h3 class="section-heading">1. The Common Mistake: Beautiful Showroom Pieces that Choke Indian Homes</h3>
    <p>When outfitting an apartment, families often buy oversized showroom sofas or king beds that end up blocking walkways and hitting wardrobe doors. At <strong>Asha Interiors</strong>, we believe in educating visitors with real scientific numbers to optimize space perfectly.</p>

    <h3 class="section-heading">2. The Science of Walkway Clearances & Human Circulation</h3>
    <div class="metric-grid">
        <div class="metric-card"><div class="metric-num">600 mm (24")</div><div class="metric-label">MINIMUM BODY TRANSIT SLIP</div></div>
        <div class="metric-card"><div class="metric-num">900 mm (36")</div><div class="metric-label">STANDARD TWO-PERSON BYPASS</div></div>
        <div class="metric-card"><div class="metric-num">750 mm (30")</div><div class="metric-label">FUNCTIONAL SHUTTER CLEARANCE</div></div>
    </div>

    <h3 class="section-heading">3. The Master Furniture Dimension & Suitability Matrix</h3>
    <table>
        <thead>
            <tr><th>Item Category</th><th>Ideal Standard Measurements</th><th>What Suits Perfectly</th><th>What NOT to Buy (Avoid)</th></tr>
        </thead>
        <tbody>
            <tr><td><strong>1. Living Room Sofa Set</strong></td><td>Seat Height: 400-450 mm<br>Seat Depth: 850-900 mm<br>Clear Walkway: 900 mm</td><td>Straight 3-Seater or clean L-shape with sleek legs to show floor area.</td><td>Bulky Maharaja or puffy leatherette sofas that block room views.</td></tr>
            <tr><td><strong>2. Master Bedroom Bed</strong></td><td>King: 1800x2000 mm<br>Queen: 1500x2000 mm<br>Side Walkway: Min 650 mm</td><td>Low-height beds with hydraulic storage and thin, flush headboards.</td><td>Massive poster beds or thick extended chesterfield wings.</td></tr>
            <tr><td><strong>3. Modular Wardrobes</strong></td><td>Internal Depth: 600 mm<br>Hanging Height: 1200 mm<br>Door Swing: 750 mm</td><td>Sliding doors for narrow spaces; 12mm internal lining laminates.</td><td>Loosely built local almirahs with manual locks.</td></tr>
            <tr><td><strong>4. Family Dining Table</strong></td><td>Table Height: 750 mm<br>Per-Person Width: 600 mm<br>Back Clearance: 800 mm</td><td>Sleek engineered wooden or glass tops with benches that tuck underneath.</td><td>Heavy 6-seater solid marble tops that compress walkway.</td></tr>
            <tr><td><strong>5. Kitchen Counter & Storage</strong></td><td>Counter Height: 850 mm<br>Dado Splash Height: 600 mm<br>Aisle Width: Min 1050 mm</td><td>Modular drawers with tandem boxes; custom heights adjusted for family cook.</td><td>Deep overhead shutter cabinets causing head injury hazards.</td></tr>
            <tr><td><strong>6. TV Console & Media Unit</strong></td><td>Depth: 300-350 mm max<br>Viewing Center: 1050 mm from floor</td><td>Wall-mounted sleek consoles with hidden cable channels.</td><td>Heavy floor-standing wooden display showcases.</td></tr>
            <tr><td><strong>7. Work-From-Home Desk</strong></td><td>Table Height: 740-760 mm<br>Depth: 500-600 mm<br>Leg Clearance: 650 mm</td><td>Floating wall desks with wire grommets and sleek open metal framing legs.</td><td>Huge executive double-pedestal desks that trap dust in corners.</td></tr>
        </tbody>
    </table>

    <div class="callout-box">
        <div class="callout-title">The Golden Optimization Rule:</div>
        For small to medium living zones, always choose furniture with exposed or raised legs so the human eye sees the floor line continuing underneath.
    </div>

    <h3 class="section-heading">4. Operational Blueprint & Space Control</h3>
    <p>Trust <strong>Asha Interiors</strong> to keep your layouts balanced, your choices practical, and your project delivery entirely within budget.</p>

    <div class="footer">
        <span>Asha Interiors • Furniture Ergonomics & Space Optimization Standard © 2026</span>
        <span>Page 1 of 1</span>
    </div>
</body>
</html>
"@

# Save HTML files & generate PDFs
$guides = @(
    @{ html = "g1.html"; pdf = "Asha_Interiors_Budget_Guide.pdf"; content = $g1_html },
    @{ html = "g2.html"; pdf = "Asha_Interiors_MiddleClass_Renovation_Guide.pdf"; content = $g2_html },
    @{ html = "g3.html"; pdf = "Asha_Interiors_Room_Measurement_Precision_Guide.pdf"; content = $g3_html },
    @{ html = "g4.html"; pdf = "Asha_Interiors_Furniture_Dimension_Precision_Guide.pdf"; content = $g4_html }
)

foreach ($g in $guides) {
    $htmlFile = Join-Path $PSScriptRoot $g.html
    $pdfFile = Join-Path $PSScriptRoot $g.pdf
    $g.content | Out-File -FilePath $htmlFile -Encoding utf8

    $fileUrl = "file:///" + $htmlFile.Replace("\", "/")
    $argList = @(
        "--headless",
        "--disable-gpu",
        "--no-pdf-header-footer",
        "--print-to-pdf=$pdfFile",
        $fileUrl
    )

    Start-Process -FilePath $edge -ArgumentList $argList -Wait -NoNewWindow
    
    if (Test-Path $pdfFile) {
        Write-Host "Generated $($g.pdf) - Size: $((Get-Item $pdfFile).Length) bytes"
    } else {
        Write-Host "Failed to generate $($g.pdf)"
    }
    
    Remove-Item $htmlFile -ErrorAction SilentlyContinue
}
