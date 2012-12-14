<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureApp" generation="1" functional="0" release="0" Id="e50f4831-595d-400b-88f2-0e2e7e5538a8" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
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
          <role name="MVC3WebRole" generation="1" functional="0" release="0" software="G:\AzureApp3\AzureApp\csx\Release\roles\MVC3WebRole" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
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
    <implementation Id="8c755ec4-5017-48e1-b0f9-ff79416a166d" ref="Microsoft.RedDog.Contract\ServiceContract\AzureAppContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="8eaf6d09-9ad6-43d7-ac74-b4449b964e55" ref="Microsoft.RedDog.Contract\Interface\MVC3WebRole:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/AzureApp/AzureAppGroup/MVC3WebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>