[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$form = New-Object System.Windows.Forms.Form
$location = 0

$button = New-Object System.Windows.Forms.Button
$button.Size = New-Object System.Drawing.Size(120, 30)
$button.Text = "Apply terraform"
$button.Location = "0, " + $global:location * 30
$global:location++
$button.Add_Click({Start-Process powershell -ArgumentList ("-Command cd CICD; terraform apply -auto-approve")})
$form.Controls.Add($button)

$close = New-Object System.Windows.Forms.Button
$close.Location = "0, 150"
$close.Size = New-Object System.Drawing.Size(90, 30)
$close.Text = "Close window"
$close.Add_Click({$form.Close()})

$form.Controls.Add($close)
$form.ShowDialog((New-Object System.Windows.Forms.Form -Property @{TopMost = $true}))