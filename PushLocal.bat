@echo off
echo PRESS ANY KEY TO INSTALL Cadmus Libraries TO LOCAL NUGET FEED
echo Remember to generate the up-to-date package.
c:\exe\nuget add .\Cadmus.NdpDrawings.Parts\bin\Debug\Cadmus.NdpDrawings.Parts.0.0.1.nupkg -source C:\Projects\_NuGet
c:\exe\nuget add .\Cadmus.NdpDrawings.Services\bin\Debug\Cadmus.NdpDrawings.Services.0.0.1.nupkg -source C:\Projects\_NuGet
c:\exe\nuget add .\Cadmus.Seed.NdpDrawings.Parts\bin\Debug\Cadmus.Seed.NdpDrawings.Parts.0.0.1.nupkg -source C:\Projects\_NuGet
pause
