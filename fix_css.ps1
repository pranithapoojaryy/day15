$path = "c:\Users\Pranitha\day15\index.html"
$content = Get-Content $path -Raw

$broken_css = @"
        .hero-card h1 {
            font-size: 3.8rem;
            justify-content: center;
            padding: 0.7rem 1.1rem;
            border-radius: 999px;
            background: #198754;
            color: #fff;
            font-weight: 700;
            margin-right: 0.75rem;
            margin-bottom: 0.75rem;
        }

        .hero-card .pill-secondary,
"@

$fixed_css = @"
        .hero-card h1 {
            font-size: 3.8rem;
            letter-spacing: 0;
            line-height: 1.02;
            margin-bottom: 1rem;
            color: #153d24;
        }

        .hero-card p {
            font-size: 1.05rem;
            color: #4f6951;
            margin-bottom: 1.8rem;
            max-width: 560px;
            line-height: 1.6;
        }

        .hero-card .shop-pill {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.7rem 1.1rem;
            border-radius: 999px;
            background: #198754;
            color: #fff;
            font-weight: 700;
            margin-right: 0.75rem;
            margin-bottom: 0.75rem;
        }

        .hero-card .pill-secondary,
"@

if ($content.Contains($broken_css)) {
    $content = $content.Replace($broken_css, $fixed_css)
    Set-Content -Path $path -Value $content -Encoding UTF8
    Write-Host "CSS fixed successfully."
} else {
    Write-Host "Broken CSS not found. Could not apply fix."
}
