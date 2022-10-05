Set-Location C:\Users\Ben\Documents\GitHub\SCM_Member\ASSETS\

$inFILE = 'C:\Users\Ben\Documents\GitHub\SCM_Member\ASSETS\SCM_Member_800x800.png'

$outFILE = 'C:\Users\Ben\Documents\GitHub\SCM_Member\ASSETS\SCM_Member_150x150.png'


if (Test-Path -Path $outfile) {
    Remove-Item $outfile
}
magick convert $infile -alpha on -flatten -resize 150x150 $outfile


