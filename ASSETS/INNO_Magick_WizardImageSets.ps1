Set-Location C:\Users\Ben\Documents\GitHub\SCM_Member\DEPLOY\INNO\

<#
Creation of Member PNG - orginates from GitHub\SCM_ASSETS\
Output used by INNO.
#>

$inpath = 'C:\Users\Ben\Documents\GitHub\SCM_Member\ASSETS\'
$leftpanel = $inpath + 'INNO_WizardLeftPanel_Member.png'
$square = $inpath + 'SCM_Member_800x800.png'

$outpath = 'C:\Users\Ben\Documents\GitHub\SCM_Member\DEPLOY\INNO\'
$outfileA = $outpath + 'WizardImage_SCM_*.bmp'
$outfileB = $outpath + 'WizardSmall_SCM_*.bmp'


if (Test-Path -Path $outfileA) {
    Remove-Item $outfileA
}
magick convert $leftpanel -flatten -resize 410x797 WizardImage_SCM_410x797.bmp
magick convert $leftpanel -flatten -resize 355x700 WizardImage_SCM_355x700.bmp
magick convert $leftpanel -flatten -resize 328x604 WizardImage_SCM_328x604.bmp
magick convert $leftpanel -flatten -resize 273x556 WizardImage_SCM_273x556.bmp
magick convert $leftpanel -flatten -resize 246x459 WizardImage_SCM_246x459.bmp
magick convert $leftpanel -flatten -resize 192x386 WizardImage_SCM_192x386.bmp
magick convert $leftpanel -flatten -resize 164x314 WizardImage_SCM_164x314.bmp


if (Test-Path -Path $outfileB) {
    Remove-Item $outfileB
}
magick convert $square -flatten -resize 55x55 WizardSmall_SCM_55x55.bmp
magick convert $square -flatten -resize 64x68 WizardSmall_SCM_64x68.bmp
magick convert $square -flatten -resize 83x80 WizardSmall_SCM_83x80.bmp
magick convert $square -flatten -resize 92x97 WizardSmall_SCM_92x97.bmp
magick convert $square -flatten -resize 110x106 WizardSmall_SCM_110x106.bmp
magick convert $square -flatten -resize 119x123 WizardSmall_SCM_119x123.bmp
magick convert $square -flatten -resize 138x140 WizardSmall_SCM_138x140.bmp

