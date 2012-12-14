<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureApp" generation="1" functional="0" release="0" Id="73fc6aa5-9483-41a3-b9b6-d2159be4cb1f" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureAppGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="MVC3WebRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureApp/AzureAppGroup/LB:MVC3WebRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="MVC3WebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureApp/AzureAppGroup/MapMVC3WebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="MVC3WebRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureApp/AzureAppGroup/MapMVC3WebRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:MVC3WebRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureApp/AzureAppGroup/MVC3WebRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapMVC3WebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureApp/AzureAppGroup/MVC3WebRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapMVC3WebRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureApp/AzureAppGroup/MVC3WebRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="MVC3WebRole" generation="1" functional="0" release="0" software="D:\LandLordApp Ver1.1\AzureApp\csx\Debug\roles\MVC3WebRole" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;MVC3WebRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;MVC3WebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureApp/AzureAppGroup/MVC3WebRoleInstances" />
            <sCSPolicyFaultDomainMoniker name="/AzureApp/AzureAppGroup/MVC3WebRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="MVC3WebRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="MVC3WebRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="a74d0b90-b5c1-40e9-9970-0b0a08322c30" ref="Microsoft.RedDog.Contract\ServiceContract\AzureAppContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="04f5663e-fdeb-4549-bfb1-ba8e6a0c8ab9" ref="Microsoft.RedDog.Contract\Interface\MVC3WebRole:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/AzureApp/AzureAppGroup/MVC3WebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>