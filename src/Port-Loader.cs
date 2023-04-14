<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFrameworks>netcoreapp2.1;netcoreapp2.2;netcoreapp3.0;netcoreapp3.1;net5.0;net6.0</TargetFrameworks>
    <LangVersion>9.0</LangVersion>
    <AssemblyName>AspNetCore.Unobtrusive.Ajax</AssemblyName>
    <PackageId>AspNetCore.Unobtrusive.Ajax</PackageId>
    <Product>AspNetCore.Unobtrusive.Ajax</Product>
    <Title>AspNetCore.Unobtrusive.Ajax</Title>
    <Version>2.0.0</Version>
    <PackageVersion>2.0.0</PackageVersion>
    <AssemblyVersion>2.0.0</AssemblyVersion>
    <GenerateEmbeddedFilesManifest>true</GenerateEmbeddedFilesManifest>

    <PublishRepositoryUrl>true</PublishRepositoryUrl>
    <EmbedUntrackedSources>true</EmbedUntrackedSources>
    <DebugType>embedded</DebugType>
  </PropertyGroup>

  <PropertyGroup Condition="'$(GITHUB_ACTIONS)' == 'true'">
    <ContinuousIntegrationBuild>true</ContinuousIntegrationBuild>
  </PropertyGroup>

  <ItemGroup Condition="'$(TargetFramework)'!='netcoreapp2.1' AND '$(TargetFramework)'!='netcoreapp2.2'">
    <FrameworkReference Include="Microsoft.AspNetCore.App" />
  </ItemGroup>

  <ItemGroup Condition="'$(TargetFramework)'=='netcoreapp2.1'">
    <PackageReference Include="Microsoft.AspNetCore.Http.Abstractions" Version="2.1.0" />
    <PackageReference Include="Microsoft.AspNetCore.Mvc.ViewFeatures" Version="2.1.0" />
    <PackageReference Include="Microsoft.AspNetCore.StaticFiles" Version="2.1.0" />
    <PackageReference Include="Microsoft.Extensions.FileProviders.Embedded" Version="2.1.1" />
  </ItemGroup>

  <ItemGroup Condition="'$(TargetFramework)'=='netcoreapp2.2'">
    <PackageReference Include="Microsoft.AspNetCore.Http.Abstractions" Version="2.2.0" />
    <PackageReference Include="Microsoft.AspNetCore.Mvc.ViewFeatures" Version="2.2.0" />
    <PackageReference Include="Microsoft.AspNetCore.StaticFiles" Version="2.2.0" />
    <PackageReference Include="Microsoft.Extensions.FileProviders.Embedded" Version="2.2.0" />
  </ItemGroup>
	
  <ItemGroup Condition="'$(TargetFramework)'=='netcoreapp3.0'">
	<PackageReference Include="Microsoft.Extensions.FileProviders.Embedded" Version="3.0.3" />
  </ItemGroup>

  <ItemGroup Condition="'$(TargetFramework)'=='netcoreapp3.1'">
	<PackageReference Include="Microsoft.Extensions.FileProviders.Embedded" Version="3.1.22" />
  </ItemGroup>

  <ItemGroup Condition="'$(TargetFramework)'=='net5.0'">
	<PackageReference Include="Microsoft.Extensions.FileProviders.Embedded" Version="5.0.13" />
  </ItemGroup>

  <ItemGroup Condition="'$(TargetFramework)'=='net6.0'">
	<PackageReference Include="Microsoft.Extensions.FileProviders.Embedded" Version="6.0.1" />
  </ItemGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.SourceLink.GitHub" Version="1.1.1" PrivateAssets="All" />
  </ItemGroup>

  <ItemGroup>
    <None Remove="jquery.unobtrusive-ajax.min.js" />
    <EmbeddedResource Include="jquery.unobtrusive-ajax.min.js" />
  </ItemGroup>

  <ItemGroup>
    <None Include="icon.png" Pack="true" PackagePath="" />
  </ItemGroup>

</Project>
