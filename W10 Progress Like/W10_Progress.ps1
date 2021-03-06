[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 				| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       				| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\LoadingIndicators.WPF.dll')       				| out-null

function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

# Load MainWindow
# $XamlMainWindow=LoadXml("W10_Progress_ArcsStyle.xaml")
# $XamlMainWindow=LoadXml("W10_Progress_ArcsRing.xaml")
# $XamlMainWindow=LoadXml("W10_Progress_DoubleBouncey.xaml")
# $XamlMainWindow=LoadXml("W10_Progress_FlipPlane.xaml")
# $XamlMainWindow=LoadXml("W10_Progress_Pulse.xaml")
# $XamlMainWindow=LoadXml("W10_Progress_Ring.xaml")
# $XamlMainWindow=LoadXml("W10_Progress_ThreeDots.xaml")
$XamlMainWindow=LoadXml("W10_Progress_Wave.xaml")





$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)


$Deployment_Progressbar = $Form.findname("Deployment_Progressbar") 
$Step_Status = $Form.findname("Step_Status") 
$Progress_Status = $Form.findname("Progress_Status") 

$Current_Step_Number = "24"
$Total_Step = "152"
$Current_Step_Name = "Installing Operating System"

$Current_Step_Percent = $Current_Step_Number / $Total_Step * 100 
$Round_Current_Step_Percent = [math]::Round($Current_Step_Percent)

$Step_Status.Content = "Part $Current_Step_Number on $Total_Step : $Current_Step_Name" #"Part $Current_Step_Number of $Total_Step"	
$Progress_Status.Content = "$Round_Current_Step_Percent %" 

$Form.ShowDialog() | Out-Null

