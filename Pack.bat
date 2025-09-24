@echo off
echo BUILD Cadmus NdpDrawings Packages
del .\Cadmus.NdpDrawings.Parts\bin\Debug\*.snupkg
del .\Cadmus.NdpDrawings.Parts\bin\Debug\*.nupkg

del .\Cadmus.NdpDrawings.Services\bin\Debug\*.snupkg
del .\Cadmus.NdpDrawings.Services\bin\Debug\*.nupkg

del .\Cadmus.Seed.NdpDrawings.Parts\bin\Debug\*.snupkg
del .\Cadmus.Seed.NdpDrawings.Parts\bin\Debug\*.nupkg

cd .\Cadmus.NdpDrawings.Parts
dotnet pack -c Debug -p:IncludeSymbols=true -p:SymbolPackageFormat=snupkg
cd..

cd .\Cadmus.NdpDrawings.Services
dotnet pack -c Debug -p:IncludeSymbols=true -p:SymbolPackageFormat=snupkg
cd..

cd .\Cadmus.Seed.NdpDrawings.Parts
dotnet pack -c Debug -p:IncludeSymbols=true -p:SymbolPackageFormat=snupkg
cd..

pause
