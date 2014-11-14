<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron file:///H:/src/core-maven/core-xml-beans/src/main/xsd/schematron_1.5.xsd" defaultPhase="PRPA_IN201305UV02">
	<title/>
	<ns prefix="msg" uri="urn:hl7-org:v3"/>
	<phase id="MCCI_IN000002UV01">
		<active pattern="MCCI_IN000002UV01-errors"/>
	</phase>
	<phase id="PRPA_IN201301UV02">
		<active pattern="PRPA_IN201301UV02-errors"/>
		<active pattern="MCCI_IN000100UV01-errors"/>
	</phase>
	<phase id="PRPA_IN201302UV02">
		<active pattern="PRPA_IN201302UV02-errors"/>
		<active pattern="MCCI_IN000100UV01-errors"/>
	</phase>
	<phase id="PRPA_IN201304UV02">
		<active pattern="PRPA_IN201304UV02-errors"/>
		<active pattern="MCCI_IN000100UV01-errors"/>
	</phase>
	<phase id="PRPA_IN201305UV02">
		<active pattern="PRPA_IN201305UV02-errors"/>
		<active pattern="MCCI_IN000100UV01-errors"/>
	</phase>
	<!-- <phase id='warnings'>
        <active pattern='PRPA_IN201305UV02-warnings'/>
        <active pattern='MCCI_IN000100UV01-warnings'/>
    </phase> -->
	<phase id="PRPA_IN201306UV02">
		<active pattern="PRPA_IN201306UV02-errors"/>
		<active pattern="MCCI_IN000300UV01-errors"/>
	</phase>
	<phase id="PRPA_IN201309UV02">
		<active pattern="PRPA_IN201309UV02-errors"/>
		<active pattern="MCCI_IN000100UV01-errors"/>
	</phase>
	<!--  <phase id='warnings'>
        <active pattern='PRPA_IN201309UV02-warnings'/>
        <active pattern='MCCI_IN000100UV01-warnings'/>
    </phase>-->
	<phase id="PRPA_IN201310UV02">
		<active pattern="PRPA_IN201310UV02-errors"/>
		<active pattern="MCCI_IN000300UV01-errors"/>
	</phase>
	<phase id="QUQI_IN000003UV01">
		<active pattern="QUQI_IN000003UV01-errors"/>
		<!--<active pattern='MCCI_IN000300UV01-errors'/>-->
	</phase>
	<pattern name="MCCI_IN000002UV01-errors" id="MCCI_IN000002UV01-errors">
		<rule context="/*">
			<assert test="not(*/msg:device/msg:id/@extension)">
      Error: MCCI_IN000200UV01 Device id.  IHE restriction, id.extension SHALL NOT have a value.
      See Table O.1.2-1
   </assert>
			<assert test='msg:acceptAckCode/@code="NE"'>
      Error: The attribute acceptAckCode/@code shall be set to NE. (Don't ack an ack.)
      See Section O.1.2.
   </assert>
			<assert test="msg:acknowledgement">
      Error: Acknowledgement is a required class.
      See Section O.1.2.
   </assert>
			<!-- 
We split this into two (seperate check for sender and receiver) because matches will not work 
with multiple results.
The schema allows for only one sender and IHE allows for only one receiver.

     Also note the '^' and '$' characters.  This prevents the "matches" function from only matching
     a subset.
-->
			<assert test='matches(msg:sender/msg:device/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000200UV01 Device id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.2-1
   </assert>
			<assert test='matches(msg:receiver/msg:device/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000200UV01 Device id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.2-1
   </assert>
			<assert test="not(/*/*/msg:device/msg:asAgent/msg:representedOrganization/msg:id/@extension)">
      Error: MCCI_IN000200UV01 Organization id.  IHE restriction, id.extension SHALL NOT have a value.
      See Table O.1.2-1
   </assert>
			<!--
     We split this into two (seperate check for sender and receiver) because matches will not work
     with multiple results.
     The schema allows for only one sender and IHE allows for only one receiver.

     Also note the '^' and '$' characters.  This prevents the "matches" function from only matching
     a subset.
-->
			<assert test='not(/*/msg:sender/msg:device/msg:asAgent/msg:representedOrganization) or
                matches(/*/msg:sender/msg:device/msg:asAgent/msg:representedOrganization/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000200UV01 Organization id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.2-1
   </assert>
			<assert test='not(/*/msg:receiver/msg:device/msg:asAgent/msg:representedOrganization) or
                matches(/*/msg:receiver/msg:device/msg:asAgent/msg:representedOrganization/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000200UV01 Organization id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.2-1
   </assert>
		</rule>
	</pattern>
	<pattern name='MCCI_IN000100UV01-errors' id='MCCI_IN000100UV01-errors'>
		<rule context='/*'>
			<assert test='not(*/msg:device/msg:id/@extension)'>
      Error: MCCI_IN000100UV01 Device id.  IHE restriction, id.extension SHALL NOT have a value.
      See Table O.1.1-1
   </assert>
			<!-- 
     We split this into two (seperate check for sender and receiver) because matches will not work 
     with multiple results.
     The schema allows for only one sender and IHE allows for only one receiver.

     Also note the '^' and '$' characters.  This prevents the "matches" function from only matching
     a subset.
-->
			<assert test='matches(msg:sender/msg:device/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000100UV01 Device id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.1-1
   </assert>
			<assert test='matches(msg:receiver/msg:device/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000100UV01 Device id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.1-1
   </assert>
			<assert test='not(/*/*/msg:device/msg:asAgent/msg:representedOrganization/msg:id/@extension)'>
      Error: MCCI_IN000100UV01 Organization id.  IHE restriction, id.extension SHALL NOT have a value.
      See Table O.1.1-1
   </assert>
			<!--
     We split this into two (seperate check for sender and receiver) because matches will not work
     with multiple results.
     The schema allows for only one sender and IHE allows for only one receiver.

     Also note the '^' and '$' characters.  This prevents the "matches" function from only matching
     a subset.
-->
			<assert test='not(/*/msg:sender/msg:device/msg:asAgent/msg:representedOrganization) or
                matches(/*/msg:sender/msg:device/msg:asAgent/msg:representedOrganization/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000100UV01 Organization id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.1-1
   </assert>
			<assert test='not(/*/msg:receiver/msg:device/msg:asAgent/msg:representedOrganization) or
                matches(/*/msg:receiver/msg:device/msg:asAgent/msg:representedOrganization/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000100UV01 Organization id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.1-1
   </assert>
		</rule>
	</pattern>
	<pattern name='MCCI_IN000300UV01-errors' id='MCCI_IN000300UV01-errors'>
		<rule context='/*'>
			<assert test='msg:acceptAckCode/@code="NE"'>
      Error: MCCI_IN000300UV01 Accept Ack Code is fixed to 'NE' (Never) as this is an acknowledgment itself.
      See Table O.1.3-2
   </assert>
			<assert test='not(*/msg:device/msg:id/@extension)'>
      Error: MCCI_IN000300UV01 Device id.  IHE restriction, id.extension SHALL NOT have a value.
      See Table O.1.3-2
   </assert>
			<!-- 
     We split this into two (seperate check for sender and receiver) because matches will not work 
     with multiple results.
     The schema allows for only one sender and IHE allows for only one receiver.

     Also note the '^' and '$' characters.  This prevents the "matches" function from only matching
     a subset.
-->
			<assert test='matches(msg:sender/msg:device/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000300UV01 Device id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.3-2
   </assert>
			<assert test='matches(msg:receiver/msg:device/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000300UV01 Device id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.3-2
   </assert>
			<assert test='not(/*/*/msg:device/msg:asAgent/msg:representedOrganization/msg:id/@extension)'>
      Error: MCCI_IN000300UV01 Organization id.  IHE restriction, id.extension SHALL NOT have a value.
      See Table O.1.3-2
   </assert>
			<!--
     We split this into two (seperate check for sender and receiver) because matches will not work
     with multiple results.
     The schema allows for only one sender and IHE allows for only one receiver.

     Also note the '^' and '$' characters.  This prevents the "matches" function from only matching
     a subset.
-->
			<assert test='not(/*/msg:sender/msg:device/msg:asAgent/msg:representedOrganization) or
                matches(/*/msg:sender/msg:device/msg:asAgent/msg:representedOrganization/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000300UV01 Organization id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.3-2
   </assert>
			<assert test='not(/*/msg:receiver/msg:device/msg:asAgent/msg:representedOrganization) or
                matches(/*/msg:receiver/msg:device/msg:asAgent/msg:representedOrganization/msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: MCCI_IN000300UV01 Organization id.  IHE restriction, id.root SHALL be an ISO OID.
      See Table O.1.3-2
   </assert>
		</rule>
	</pattern>
	<!-- These schematron rules validate an PixV3 message Patient Registry Record Added PRPA_IN201301UV02 -->
	<pattern name='PRPA_IN201301UV02-errors' id='PRPA_IN201301UV02-errors'>
		<rule context='/msg:PRPA_IN201301UV02'>
			<assert test='msg:interactionId/@extension="PRPA_IN201301UV02"'>
      Error: The attribute PRPA_IN201301UV02/interactionId/@extension shall equal PRPA_IN201301UV02.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='msg:processingModeCode/@code="T"'>
      Error: The attribute PRPA_IN201301UV02/processingModeCode/@code shall be set to T.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='msg:acceptAckCode/@code="AL"'>
      Error: The attribute PRPA_IN201301UV02/acceptAckCode/@code shall be set to AL.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='count(msg:receiver/msg:device) = 1'>
      Error: There shall be only one receiver device.
      See Table 3.44.4.1.2-2.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201301UV02/msg:controlActProcess'>
			<assert test='msg:code/@code="PRPA_TE201301UV02"'>
      Error: The attribute PRPA_IN201301UV02/controlActProcess/code/@code shall have the trigger event code value PRPA_TE201301UV02.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='msg:subject/msg:registrationEvent/msg:statusCode/@code="active"'>
      Error: The attribute PRPA_IN201301UV02/controlActProcess/subject/registrationEvent/statuscode/@code shall be set to active.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='not(descendant::msg:replacementOf)'>
      Error: The element replacementOf shall not be present.
      See Table 3.44.4.1.2-2.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201301UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient'>
			<assert test='msg:patientPerson'>
      Error: The patient and patientPerson have a 1...1 cardinality.
      See Figure 3.44.4.1.2-1.
   </assert>
			<assert test='((msg:patientPerson/msg:name/*) or string-length(msg:patientPerson/msg:name) > 0) or
                 (msg:id[@root or @extension])'>
      Error: Either Person.name or Patient.id must be non-null.
      See Table 3.44.4.1.2-1.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201301UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient/msg:patientPerson'>
			<assert test='@classCode="PSN"'>
      Error: The patientPerson element shall have a classCode attribute equal to "PSN".
      See Figure 3.44.4.1.2-1 and Table 3.44.4.1.2-1.
   </assert>
			<assert test='@determinerCode="INSTANCE"'>
      Error: The patientPerson element shall have a determinerCode attribute equal to "INSTANCE".
      See Figure 3.44.4.1.2-1 and Table 3.44.4.1.2-1.
   </assert>
			<assert test='not(msg:asOtherIDs[@classCode="CIT"]) and not(msg:asOtherIDs[@classCode="EMP"])'>
      Error: The patientPerson/asOtherIDs/@classCode can be any specialization of "role" except for Citizen or Employee.
      See Table 3.44.4.1.2-1.
   </assert>
		</rule>
	</pattern>
	<!-- 
 <pattern id='PRPA_IN201301UV02-note'>
 
 <rule context='/msg:PRPA_IN201301UV02/msg:controlActProcess/msg:subject/msg:registrationEvent'>      
   <assert test='not(descendant::msg:patientPerson/msg:telecom)
    or (descendant::msg:patientPerson/msg:telecom/@value or descendant::msg:patientPerson/msg:telecom/@nullFlavor)'>
           Note: A patientPerson telecom should have a non-blank telecom element or nullFlavor.</assert>   
   <assert test='not(descendant::msg:patientPerson/msg:addr) or ((normalize-space(descendant::msg:patientPerson/msg:addr) 
    or count(descendant::msg:patientPerson/msg:addr/child::*) &gt; 0) or (descendant::msg:patientPerson/msg:addr/@nullFlavor))'>
           Note: A patientPerson address should have a non-blank addr element or nullFlavor.</assert>  
   <assert test='(descendant::msg:patientPerson/msg:name) and (normalize-space(descendant::msg:patientPerson/msg:name) or count(descendant::msg:patientPerson/msg:name/child::*) &gt; 0)'>Note: The element patientPerson/name element should have a value.</assert> 
   <assert test='not(descendant::msg:patientPerson/msg:languageCommunication/msg:languageCode)'>Note: The patientPerson/LanguageCommunication/languageCode should represent the language the focal person communicates in.</assert>
  
   <assert test='not(descendant::msg:patientPerson/msg:asPatientOfOtherProvider)'>Note: The role patientPerson/asPatientOfOtherProvider was omitted.</assert> 
   <assert test='not(descendant::msg:patientPerson/msg:guarantorRole)'>Note: The role patientPerson/guarantorRole was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:guardian)'>Note: The role patientPerson/guardian was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:contactParty)'>Note: The role patientPerson/contactParty was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:asMember)'>Note: The role patientPerson/asMember was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:careGiver)'>Note: The role patientPerson/careGiver was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:asStudent)'>Note: The role patientPerson/asStudent was omitted.</assert>  
   <assert test='not(descendant::msg:patient/msg:coveredPartyOf)'>Note: The participant patient/coveredPartyOf was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:subjectOf)'>Note: The participant patient/subjectOf was omitted.</assert>

</rule>
 
</pattern>
 -->
	<!-- These schematron rules validate an PixV3 message Patient Registry Record Revised PRPA_IN201302V02 -->
	<pattern name='PRPA_IN201302UV02-errors' id='PRPA_IN201302UV02-errors'>
		<rule context='/msg:PRPA_IN201302UV02'>
			<assert test='msg:interactionId/@extension="PRPA_IN201302UV02"'>
      Error: The attribute PRPA_IN201302UV02/interactionId/@extension shall equal PRPA_IN201302UV02.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='msg:processingModeCode/@code="T"'>
      Error: The attribute PRPA_IN201302UV02/processingModeCode/@code shall be set to T.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='msg:acceptAckCode/@code="AL"'>
      Error: The attribute PRPA_IN201302UV02/acceptAckCode/@code shall be set to AL.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='count(msg:receiver/msg:device) = 1'>
      Error: There shall be only one receiver device.
      See Table 3.44.4.1.2-2.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201302UV02/msg:controlActProcess'>
			<assert test='msg:code/@code="PRPA_TE201302UV02"'>
      Error: The attribute PRPA_IN201302UV02/controlActProcess/code/@code shall have the trigger event code value PRPA_TE201302UV02.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='msg:subject/msg:registrationEvent/msg:statusCode/@code="active"'>
      Error: The attribute PRPA_IN201302UV02/controlActProcess/subject/registrationEvent/statuscode/@code shall be set to active.
      See Table 3.44.4.1.2-2.
   </assert>
			<assert test='not(descendant::msg:replacementOf)'>
      Error: The element replacementOf shall not be present.
      See Table 3.44.4.1.2-2.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201302UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient'>
			<assert test='msg:patientPerson'>
      Error: The patient and patientPerson have a 1...1 cardinality.
      See Figure 3.44.4.1.2-1.
   </assert>
			<assert test='((msg:patientPerson/msg:name/*) or string-length(msg:patientPerson/msg:name) > 0) or
                 (msg:id[@root or @extension])'>
      Error: Either Person.name or Patient.id must be non-null.
      See Table 3.44.4.1.2-1.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201302UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient/msg:patientPerson'>
			<assert test='@classCode="PSN"'>
      Error: The patientPerson element shall have a classCode attribute equal to "PSN".
      See Figure 3.44.4.1.2-1 and Table 3.44.4.1.2-1.
   </assert>
			<assert test='@determinerCode="INSTANCE"'>
      Error: The patientPerson element shall have a determinerCode attribute equal to "INSTANCE".
      See Figure 3.44.4.1.2-1 and Table 3.44.4.1.2-1.
   </assert>
			<assert test='not(msg:asOtherIDs[@classCode="CIT"]) and not(msg:asOtherIDs[@classCode="EMP"])'>
      Error: The patientPerson/asOtherIDs/@classCode can be any specialization of "role" except for Citizen or Employee.
      See Table 3.44.4.1.2-1.
   </assert>
		</rule>
	</pattern>
	<!-- 
 <pattern id='PRPA_IN201302UV02-note'>
 
 <rule context='/msg:PRPA_IN201302UV02/msg:controlActProcess/msg:subject/msg:registrationEvent'>      
   <assert test='not(descendant::msg:patientPerson/msg:telecom)
    or (descendant::msg:patientPerson/msg:telecom/@value or descendant::msg:patientPerson/msg:telecom/@nullFlavor)'>
           Note: A patientPerson telecom should have a non-blank telecom element or nullFlavor.</assert>   
   <assert test='not(descendant::msg:patientPerson/msg:addr) or ((normalize-space(descendant::msg:patientPerson/msg:addr) 
    or count(descendant::msg:patientPerson/msg:addr/child::*) &gt; 0) or (descendant::msg:patientPerson/msg:addr/@nullFlavor))'>
           Note: A patientPerson address should have a non-blank addr element or nullFlavor.</assert>  
   <assert test='(descendant::msg:patientPerson/msg:name) and (normalize-space(descendant::msg:patientPerson/msg:name) or count(descendant::msg:patientPerson/msg:name/child::*) &gt; 0)'>Note: The element patientPerson/name element should have a value.</assert> 
   <assert test='not(descendant::msg:patientPerson/msg:languageCommunication/msg:languageCode)'>Note: The patientPerson/LanguageCommunication/languageCode should represent the language the focal person communicates in.</assert>
  
   <assert test='not(descendant::msg:patientPerson/msg:asPatientOfOtherProvider)'>Note: The role patientPerson/asPatientOfOtherProvider was omitted.</assert> 
   <assert test='not(descendant::msg:patientPerson/msg:guarantorRole)'>Note: The role patientPerson/guarantorRole was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:guardian)'>Note: The role patientPerson/guardian was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:contactParty)'>Note: The role patientPerson/contactParty was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:asMember)'>Note: The role patientPerson/asMember was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:careGiver)'>Note: The role patientPerson/careGiver was omitted.</assert>
   <assert test='not(descendant::msg:patientPerson/msg:asStudent)'>Note: The role patientPerson/asStudent was omitted.</assert>  
   <assert test='not(descendant::msg:patient/msg:coveredPartyOf)'>Note: The participant patient/coveredPartyOf was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:subjectOf)'>Note: The participant patient/subjectOf was omitted.</assert>

</rule>
 
</pattern>
 -->
	<!-- These schematron rules validate an PixV3 message Patient Registry Record Revised PRPA_IN201304UV02 -->
	<pattern name='PRPA_IN201304UV02-errors' id='PRPA_IN201304UV02-errors'>
		<rule context='/msg:PRPA_IN201304UV02'>
			<assert test='msg:interactionId/@extension="PRPA_IN201304UV02"'>
      Error: The attribute PRPA_IN201304UV02/interactionId/@extension shall equal PRPA_IN201304UV02.
      See Table 3.44.4.2.2-3.
   </assert>
			<assert test='msg:processingModeCode/@code="T"'>
      Error: The attribute PRPA_IN201304UV02/processingModeCode/@code shall be set to T.
      See Table 3.44.4.2.2-3.
   </assert>
			<assert test='msg:acceptAckCode/@code="AL"'>
      Error: The attribute PRPA_IN201304UV02/acceptAckCode/@code shall be set to AL.
      See Table 3.44.4.2.2-3.
   </assert>
			<assert test='count(msg:receiver) = 1'>
      Error: The shall be 1 element PRPA_IN201304UV02/receiver.
      See Table 3.44.4.2.2-3.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201304UV02/msg:controlActProcess'>
			<assert test='msg:code/@code="PRPA_TE201304UV02"'>
      Error: The attribute PRPA_IN201304UV02/controlActProcess/code/@code shall have the value PRPA_TE201304UV02.
      See Table 3.44.4.2.2-3.
   </assert>
			<assert test='msg:subject/msg:registrationEvent/msg:statusCode/@code="active"'>
      Error: The attribute PRPA_IN201304UV02/controlActProcess/subject/registrationEvent/statuscode/@code shall be set to active.
      See Table 3.44.4.2.2-1.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201304UV02/msg:controlActProcess/msg:subject/msg:registrationEvent'>
			<assert test='msg:statusCode/@code="active"'>
      Error: The attribute PRPA_IN201304UV02/controlActProcess/subject/registrationEvent/statusCode@code shall be set to active.
      See Table 3.44.4.2.2-3.
   </assert>
			<assert test='msg:replacementOf'>
      Error: The element registrationEvent/replacementOf shall be present.
      See Table 3.44.4.2.2-3.
   </assert>
			<assert test='msg:replacementOf/msg:priorRegistration/msg:statusCode/@code="obsolete"'>
      Error: The attribute for registrationEvent/replacementOf/priorRegistration/statusCode/@code shall be obsolete.
      See Table 3.44.4.2.2-3.
   </assert>
			<assert test='msg:replacementOf/msg:priorRegistration'>
      Error: The element registrationEvent/replacementOf/priorRegistration shall be present.
      See Table 3.44.4.2.2-3.
   </assert>
			<assert test='msg:replacementOf/msg:priorRegistration/msg:subject1/msg:priorRegisteredRole/msg:id/@root'>
      Error: There shall be a single priorRegistration role id that represents the subsumed patient identifier.
      See Table 3.44.4.2.2-3.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201304UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient'>
			<assert test='(msg:patientPerson/msg:name/*) or string-length(msg:patientPerson/msg:name) > 0'>
      Error: Person.name must be non-null.
      See Table 3.44.4.2.2-1.
   </assert>
			<assert test='msg:id[@root or @extension]'>
      Error: Patient.id must be non-null.
      See Table 3.44.4.2.2-1.
   </assert>
		</rule>
	</pattern>
	<!--
<pattern id='PRPA_IN201304UV02-note'>
 
 <rule context='/msg:PRPA_IN201304UV02'>   
   <assert test='not(msg:id/@root)'>Note: The attribute PRPA_IN201304UV02/id/@root should be a unique UUID.</assert>  
   <assert test='not(msg:creationTime/@value)'>Note: The attribute PRPA_IN201304UV02/creationTime/@value should be generated for each message.</assert>
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient/msg:id/@extension)'>Note: The attribute PRPA_IN201304UV02/controlActProcess/subject/registrationEvent/subject1/patient/id/@extension should be the patient identifier.</assert>
   <assert test='(//msg:patientPerson/msg:name) and (normalize-space(//patientPerson/msg:name) or count(//msg:patientPerson/msg:name/child::*) > 0)'>Note: The element //patientPerson/name element should have a value.</assert>

   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:custodian)'>Note: The class registrationEvent/custodian was removed.</assert>
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:author)'>Note: The class registrationEvent/authr was removed.</assert>
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:definition)'>Note: The class registrationEvent/definition was removed.</assert>
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:custodian)'>Note: The class registrationEvent/inFullfillmentOf was removed.</assert>
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:replacement)'>Note: The class registrationEvent/replacementOf was removed.</assert>
</rule>
 
 <rule context='/msg:PRPA_IN201310UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient'>
   <assert test='not(msg:effectiveTime)'>Note: The optional attribute patient.effectiveTime was removed.</assert>
   <assert test='not(msg:confidentialityCode)'>Note: The optional attribute patient.confidentialityCode was removed.</assert>
   <assert test='not(msg:patientNonPersonLivingSubject)'>Note: The optional attribute patient.patientNonPersonLivingSubject was removed.</assert>
   <assert test='not(msg:veryImportantPersonCode)'>Note: The optional attribute patient.veryImportantPersonCode was removed.</assert>   
   <assert test='not(msg:coveredPartyOf)'>Note: The optional attribute patient.coveredPartyOf was removed.</assert>   
  
   <assert test='not(msg:patientPerson/msg:addr)'>Note: The optional attribute patientPerson.addr was removed.</assert> 
   <assert test='not(msg:patientPerson/msg:administrativeGenderCode)'>Note: The optional attribute patientPerson.administrativeGenderCode was removed.</assert> 
   <assert test='not(msg:patientPerson/msg:asCitizen)'>Note: The optional attribute patientPerson.asCitizen was removed.</assert> 
   <assert test='not(msg:patientPerson/msg:asStudent)'>Note: The optional attribute patientPerson.asStudent was removed.</assert>
   <assert test='not(msg:patientPerson/msg:asEmployee)'>Note: The optional attribute patientPerson.asEmployee was removed.</assert>
   <assert test='not(msg:patientPerson/msg:asMember)'>Note: The optional attribute patientPerson.asMember was removed.</assert>      
   <assert test='not(msg:patientPerson/msg:asPatientOfOtherProvider)'>Note: The optional attribute patientPerson.asPatientOfOtherProvider was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:birthPlace)'>Note: The optional attribute patientPerson.birthPlace was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:birthTime)'>Note: The optional attribute patientPerson.birthTime was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:careGiver)'>Note: The optional attribute patientPerson.careGiver was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:contactParty)'>Note: The optional attribute patientPerson.contactParty was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:deceasedInd)'>Note: The optional attribute patientPerson.deceasedInd was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:desc)'>Note: The optional attribute patientPerson.desc was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:disabilityCode)'>Note: The optional attribute patientPerson.disabilityCode was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:educationLevelCode)'>Note: The optional attribute patientPerson.educationLevelCode was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:ethnicGroupCode)'>Note: The optional attribute patientPerson.ethnicGroupCode was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:guarantorRole)'>Note: The optional attribute patientPerson.guarontorRole was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:guardian)'>Note: The optional attribute patientPerson.guardian was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:languageCommunication)'>Note: The optional attribute patientPerson.languageCommunication was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:livingArrangementCode)'>Note: The optional attribute patientPerson.livingArrangementCode was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:maritialStatusCode)'>Note: The optional attribute patientPerson.maritialStatusCode was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:multipleBirthInd)'>Note: The optional attribute patientPerson.multipleBirthInd was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:multipleBirthOrderNumber)'>Note: The optional attribute patientPerson.multipleBirthOrderNumber was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:organDonorId)'>Note: The optional attribute patientPerson.organDonorId was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:personalRelationship)'>Note: The optional attribute patientPerson.personalRelationship was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:raceCode)'>Note: The optional attribute patientPerson.raceCode was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:religiousAffiliationCode)'>Note: The optional attribute patientPerson.religiousAffiliationCode was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:telecom)'>Note: The optional attribute patientPerson.telecom was removed.</assert>   
 </rule>  
 </pattern>
-->
	<!-- These schematron rules validate an PixV3 message Patient Registry Find Candidates Query PRPA_IN201305UV02 -->
	<pattern name='PRPA_IN201305UV02-errors' id='PRPA_IN201305UV02-errors'>
		<rule context='/msg:PRPA_IN201305UV02'>
			<assert test='msg:interactionId/@extension="PRPA_IN201305UV02"'>
      Error: The attribute PRPA_IN201305UV02/interactionId/@extension shall equal PRPA_IN201305UV02.
      See Table 3.47.4.1.2-7.
   </assert>
			<assert test='msg:processingModeCode/@code="T"'>
      Error: The attribute PRPA_IN201305UV02/processingModeCode/@code shall be set to T.
      See Table 3.47.4.1.2-7.
   </assert>
			<assert test='msg:acceptAckCode/@code="AL"'>
      Error: The attribute PRPA_IN201305UV02/acceptAckCode/@code shall be set to AL.
      See Table 3.47.4.1.2-7.
   </assert>
			<assert test='count(msg:receiver/msg:device) = 1'>
      Error: There shall be only one element PRPA_IN201305UV02/receiver/device.
      See Table 3.47.4.1.2-7.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201305UV02/msg:controlActProcess'>
			<assert test='msg:code'>
      Error: The element PRPA_IN201305UV02/controlActProcess/Code shall be present.
      See Table 3.47.4.1.2-7.
   </assert>
			<assert test='msg:code/@code="PRPA_TE201305UV02"'>
      Error: The attribute PRPA_IN201305UV02/controlActProcess/Code/@code shall have the trigger event code value PRPA_TE201305UV02.
      See Table 3.47.4.1.2-7.
   </assert>
			<assert test='not(msg:authorOrPerformer) or msg:authorOrPerformer[@typeCode="AUT"]'>
      Error: The controlActProcess/authorOrPerformer/@typeCode shall be set to "AUT".
      See Table 3.47.4.1.2-7.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201305UV02/msg:controlActProcess/msg:queryByParameter'>
			<assert test='msg:responseModalityCode[@code="R"]'>
      Error: The queryByParameter/responseModalityCode/@code is required and fixed to "R".
      See Section 3.47.4.1.2.2.
   </assert>
			<assert test='msg:responsePriorityCode[@code="I"]'>
      Error: The queryByParameter/responsePriorityCode/@code is required and fixed to "I".
      See Section 3.47.4.1.2.2.
   </assert>
		</rule>
		<!-- 

Already fixed via schema.

<rule context='/msg:PRPA_IN201305UV02/msg:controlActProcess/msg:queryByParameter/msg:matchCriterionList'>
   <assert test='not(msg:matchAlgorithm/msg:value) or (msg:matchAlgorithm/msg:value/@xsi:type="ST")'>
      Error: The matchCriterionList/matchAlgorithm/value is constrained to "ST".
      See Section 3.47.4.1.2.2.         
   </assert>
   <assert test='not(msg:minimumDegreeMatch/msg:value) or (msg:minimumDegreeMatch/msg:value[@xsi:type="INT"])'>
      Error: The matchCriterionList/minimumDegreeMatch/value is constrained to "INT".
      See Section 3.47.4.1.2.2.
   </assert> 
</rule>
 
<rule context='/msg:PRPA_IN201305UV02/msg:controlActProcess/msg:queryByParameter/msg:parameterList'>   
   <assert test='not(msg:livingSubjectName/msg:value) or msg:livingSubjectName/msg:value[@xsi:type="PN"]'>
      Error: The element parameterList/livingSubjectName/value/@xsi:type is constrained to "PN".
      See Section 3.47.4.1.2.2.
   </assert> 
   <assert test='not(msg:patientAddress/msg:value) or msg:patientAddress/msg:value[@xsi:type="AD"]'>
      Error: The element parameterList/patientAddress/value/@xsi:type shall be "AD".
      See Section 3.47.4.1.2.2.
   </assert>       
    
 </rule>
-->
	</pattern>
	<pattern name='PRPA_IN201305UV02-warnings' id='PRPA_IN201305UV02-warnings'>
		<rule context='/msg:PRPA_IN201305UV02/msg:controlActProcess'>
			<assert test='@moodCode="RQO"'>
      Warning: According to Table 3.47.4.1.2-7, the atrribute PRPA_IN201305UV02/controlActProcess/@moodCode shall be set to 
      RQO (Request-Order).
      However, this violates the version of the PRPA_IN201305UV02 schema and HL7 model pointed to by the IHE ITI specification
      which forces this element to be an EVN (Event).
      This discrepancy has been documented in a Change Proposal (CP-ITI-455).  This warning message may change upon the resolution
      of that Change Proposal.
   </assert>
		</rule>
	</pattern>
	<!-- 
<pattern id='PRPA_IN201305UV02-note'>

<rule context='/msg:PRPA_IN201305UV02/msg:controlActProcess/msg:queryByParameter'>
<assert test='not(msg:parameterList/msg:id)'>Note: The optional attribute queryByParameter.parameterList.id  was omitted from the model.</assert>
<assert test='not(msg:responseElementGroupId)'>Note: The optional attribute queryByParameter.responseElementGroupId was omitted from the model.</assert>
    <assert test='not(msg:modifyCode)'>Note: The optional attribute queryByParameter.modifyCode was omitted from the model.</assert>
    <assert test='not(msg:executionAndDeliveryTime)'>Note: The optional attribute queryByParameter.executionAndDeliveryTime was omitted from the model.</assert>
    <assert test='not(descendant-or-self::*/msg:sortControl)'>Error: The optional sortControl was omitted from the model.</assert> 
    <assert test='not(descendant-or-self::*/msg:matchWeight)'>Error: The optional  matchWeight was omitted from the model.</assert>  
 </rule>
 
 <rule context='/msg:PRPA_IN201305UV02/msg:controlActProcess/msg:queryByParameter/msg:parameterList'>     
    <assert test='not(descendant::msg:patientAddress/msg:value) or ((normalize-space(descendant::msg:patientAddress/msg:value) 
     or count(descendant::msg:patientAddress/msg:value/child::*) &gt; 0) or (descendant::msg:patientAddress/msg:value/@nullFlavor))'>
       Note: A patientPerson address should have a non-blank addr element or nullFlavor.
    </assert>  
    <assert test='(descendant::msg:livingSubjectName/msg:value) and (normalize-space(descendant::msg:livingSubjectName/msg:value) 
       or count(descendant::msg:livingSubjectName/msg:value/child::*) > 0)'>
       Note:  The element patientPerson/name element should have a value.
    </assert> 
    <assert test='not(descendant::msg:patientTelecom)'>Note: The optional parameter queryByParameter/parameterList/patientTelecom was omitted from the model.</assert>  
    <assert test='not(descendant::msg:principalCareProvisionId)'>Note: The optional parameter queryByParameter/parameterList/principalCareProvisionId was omitted from the model.</assert>  
    <assert test='not(descendant::msg:mothersMaidenName)'>Note: The optional parameter queryByParameter/parameterList/mothersMaidenName was omitted from the model.</assert>  
    <assert test='not(descendant::msg:livingSubjectDeceasedTime)'>Note: The optional parameter queryByParameter/parameterList/livingSubjectDeceasedTime was omitted from the model.</assert>  
    <assert test='not(descendant::msg:patientStatusCode)'>Note: The optional parameter queryByParameter/parameterList/patientStatusCode was omitted from the model.</assert>  
    <assert test='not(descendant::msg:livingSubjectBirthPlaceName)'>Note: The optional parameter queryByParameter/parameterList/livingSubjectBirthPlaceName was omitted from the model.</assert>  
    <assert test='not(descendant::msg:livingSubjectBirthPlaceAddress)'>Note: The optional parameter queryByParameter/parameterList/livingSubjectBirthPlaceAddress was omitted from the model.</assert>   
</rule>
</pattern>
 -->
	<!-- These schematron rules validate an PixV3 message Patient Registry Find Candidates Query Response PRPA_IN201306UV02 -->
	<pattern name='PRPA_IN201306UV02-errors' id='PRPA_IN201306UV02-errors'>
		<rule context='/msg:PRPA_IN201306UV02'>
			<assert test='msg:interactionId/@extension="PRPA_IN201306UV02"'>
      Error: The attribute PRPA_IN201306UV02/interactionId/@extension shall equal PRPA_IN201306UV02.
      See Table 3.47.4.4.2-9.
   </assert>
			<assert test='msg:processingModeCode/@code="T"'>
      Error: The attribute PRPA_IN201306UV02/processingModeCode/@code shall be set to T.
      See Table 3.47.4.4.2-9.
   </assert>
			<assert test='msg:acceptAckCode/@code="NE"'>
      Error: The attribute PRPA_IN201306UV02/acceptAckCode/@code shall be set to NE.
      See Table 3.47.4.4.2-9.
   </assert>
			<assert test='count(msg:receiver/msg:device) = 1'>
      Error: There shall be only one element PRPA_IN201306UV02/receiver/device.
      See Table 3.47.4.4.2-9.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201306UV02/msg:controlActProcess'>
			<assert test='@moodCode="EVN"'>
      Error: The controlActProcess/@moodCode shall be set to "EVN".
      See Table 3.47.4.4.2-9.
   </assert>
			<assert test='msg:code'>
      Error: The element PRPA_IN201306UV02/controlActProcess/Code shall be present.
      See Table 3.47.4.4.2-9.
   </assert>
			<assert test='msg:code/@code="PRPA_TE201306UV02"'>
      Error: The attribute PRPA_IN201306UV02/controlActProcess/Code/@code shall have the trigger event code value PRPA_TE201306UV02.
      See Table 3.47.4.4.2-9.
   </assert>
			<assert test='msg:queryAck/msg:queryId'>
      Error: The controlActProcess/queryAck/queryId shall be present and populated with the query ID to which this message
      is a response.
      See Table O.2.2-2.
   </assert>
			<assert test='msg:queryAck/msg:resultTotalQuantity'>
      Error: The controlActProcess/queryAck/resultTotalQuantity shall be present and populated with the appropriate values.
      See Table 3.47.4.4.2-9.
   </assert>
			<assert test='msg:queryAck/msg:resultCurrentQuantity'>
      Error: The controlActProcess/queryAck/resultCurrentQuantity shall be present and populated with the appropriate values.
      See Table 3.47.4.4.2-9.
   </assert>
			<assert test='msg:queryAck/msg:resultRemainingQuantity'>
      Error: The controlActProcess/queryAck/resultRemainingQuantity shall be present and populated with the appropriate values.
      See Table 3.47.4.4.2-9.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201306UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient'>
			<assert test='msg:statusCode[@code="active"]'>
      Error: The patient/statusCode/@code shall be set to active. This value specifies the state of the record in a patient registry.
      See Table 3.47.4.2.2-8.
   </assert>
			<assert test='((msg:patientPerson/msg:name/*) or string-length(msg:patientPerson/msg:name) > 0) or
                 (msg:id[@root or @extension])'>
      Error: Either Person.name or Patient.id must be non-null.
      See Table 3.47.4.2.2-8.
   </assert>
		</rule>
	</pattern>
	<!-- 
 <pattern id='PRPA_IN201306UV02-note'>
 
 <rule context='/msg:PRPA_IN201306UV02/msg:controlActProcess'>
   <assert test='not(descendant::msg:patient/msg:patientPerson/msg:asPatientOfOtherProvider)'>Note:The role patient/patientPerson/asPatientOfOtherProvider was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:patientPerson/msg:birthPlace)'>Note: The role patient/patientPerson/birthPlace  was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:patientPerson/msg:guardian)'>Note: The role patient/patientPerson/guardian was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:patientPerson/msg:contactParty)'>Note: The role patient/patientPerson/contactParty was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:patientPerson/msg:asMember)'>Note: The role patient/patientPerson/asMember was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:patientPerson/msg:careGiver)'>Note: The role patient/patientPerson/careGiver was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:patientPerson/msg:asStudent)'>Note: The role patient/patientPerson/asStudent was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:patientPerson/msg:guarantorRole)'>Note: The role patient/patientPerson/guarantorRole was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:subjectOf1/msg:administrativeObservation)'>Note: The participant patient/subjectOf1 (administrativeObservation) was omitted.</assert>
   <assert test='not(descendant::msg:patient/msg:coveredPartyOf)'>Note: The participant patient/coveredPartyOf was omitted.</assert> 
 </rule>
 
 <rule context='/msg:PRPA_IN201306UV02/msg:controlActProcess/msg:queryByParameter/msg:parameterList'>      
    <assert test='not(descendant::msg:patientAddress/msg:value) or ((normalize-space(descendant::msg:patientAddress/msg:value) 
       or count(descendant::msg:patientAddress/msg:value/child::*) &gt; 0) or (descendant::msg:patientAddress/msg:value/@nullFlavor))'>
       Note: A patientPerson address should have a non-blank addr element or nullFlavor.
    </assert> 
    <assert test='(descendant::msg:livingSubjectName/msg:value) and (normalize-space(descendant::msg:livingSubjectName/msg:value) 
       or count(descendant::msg:livingSubjectName/msg:value/child::*) > 0)'>
       Note:  The element patientPerson/name element should have a value.
    </assert>  
</rule>
</pattern>
-->
	<!-- These schematron rules validate an PixV3 message Patient Registry Query by Indentifier PRPA_IN201309UV02 -->
	<pattern name='PRPA_IN201309UV02-errors' id='PRPA_IN201309UV02-errors'>
		<rule context='/msg:PRPA_IN201309UV02'>
			<assert test='msg:interactionId/@extension="PRPA_IN201309UV02"'>
      Error: The attribute PRPA_IN201309UV02/interactionId/@extension shall equal PRPA_IN201309UV02.
      See Table 3.45.4.1.2-4.
   </assert>
			<assert test='msg:processingModeCode/@code="T"'>
      Error: The attribute PRPA_IN201309UV02/processingModeCode/@code shall be set to T.
      See Table 3.45.4.1.2-4.
   </assert>
			<assert test='msg:acceptAckCode/@code="AL"'>
      Error: The attribute PRPA_IN201309UV02/acceptAckCode/@code shall be set to AL.
      See Table 3.45.4.1.2-4.
   </assert>
			<assert test='count(msg:receiver) = 1'>
      Error: There shall be 1 element PRPA_IN201309UV/receiver.
      See Table 3.45.4.1.2-4.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201309UV02/msg:controlActProcess'>
			<assert test='msg:code[@code ="PRPA_TE201309UV02"]'>
      Error: The attribute PRPA_IN201309UV02/controlActProcess/code/@code shall have the value PRPA_TE201309UV02.
      See Table 3.45.4.1.2-4.
   </assert>
			<assert test='msg:authorOrPerformer[@typeCode="AUT"]'>
      Error: The element authorOrPerformer/@typeCode shall be set to AUT.
      See Table 3.45.4.1.2-4.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201309UV02/msg:controlActProcess/msg:queryByParameter'>
			<assert test='count(msg:parameterList/msg:patientIdentifier) = 1'>
      Error: There shall be exactly one controlActProcess/queryByParameter/parameterList/patientIdentifier element.
      See Section 3.45.4.1.2.2.
   </assert>
			<assert test='count(msg:parameterList/msg:patientIdentifier/msg:value) = 1'>
      Error: There shall be exactly one controlActProcess/queryByParameter/parameterList/patientIdentifier/value element.
      See Section 3.45.4.1.2.2.
   </assert>
			<assert test='count(msg:dataSource) = count(msg:dataSource/msg:value)'>
      Error: If one or more DataSource parameters are present, each SHALL contain exactly one DataSource.value parameter
      See Section 3.45.4.1.2.2.
   </assert>
			<assert test='msg:responsePriorityCode/@code = "I"'>
      Error: The attribute controlActProcess/queryByParameter/responsePriorityCode/@code is required and is fixed to "I".
      See Section 3.45.4.1.2.2.
   </assert>
			<assert test='msg:statusCode/@code="new"'>
      Error: No continuations necessary for this type of query so QueryByParameter statusCode is always "new".
      See Table 3.45.4.1.2-2.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201309UV02/msg:controlActProcess/msg:queryByParameter/msg:parameterList/msg:dataSource/msg:value'>
			<assert test='not(@extension)'>
      Error: The attribute parameterList/dataSource/value/@extension shall not be present.
      See Table 3.45.4.1.2-2.
   </assert>
			<assert test='@root'>
      Error: The attribute parameterList/dataSource/value/@root shall be present.
      See Table 3.45.4.1.2-2.
   </assert>
			<assert test='matches(@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: The attribute parameterList/dataSource/value/@root shall be a valid ISO OID.
      See Table 3.45.4.1.2-2.
   </assert>
		</rule>
	</pattern>
	<pattern name='PRPA_IN201309UV02-warnings' id='PRPA_IN201309UV02-warnings'>
		<rule context='/msg:PRPA_IN201309UV02/msg:controlActProcess'>
			<assert test='@moodCode="RQO"'>
      Warning: According to table Table 3.45.4.1.2-4, the attribute PRPA_IN201309UV02/controlActProcess/@moodCode shall be set 
      to RQO (Request-Order).
      However, this violates the version of the PRPA_IN201309UV02 schema and HL7 model pointed to by the IHE ITI specification
      which forces this element to be an EVN (Event).
      This discrepancy has been documented in a Change Proposal (CP-ITI-455).  This warning message may change upon the resolution
      of that Change Proposal.
   </assert>
		</rule>
	</pattern>
	<!--
 <pattern id='PRPA_IN201309UV02-note'>
 
 <rule context='/msg:PRPA_IN201309UV02'>   
   <assert test='not(msg:id/@root)'>Note: The attribute PRPA_IN201309UV02/id/@root should be a unique UUID.</assert>
   <assert test='not(msg:creationTime/@value)'>Note: The attribute PRPA_IN201309UV02/creationTime/@value should be generated for each message.</assert>
 </rule>
 
 <rule context='msg:PRPA_IN201309UV02/msg:controlActProcess/msg:queryByParameter'>
   <assert test='not(msg:parameterList/msg:id)'>Note: The optional attribute queryByParameter.patientList.id was removed from the model.</assert>
   <assert test='not(msg:responseElementGroupId)'>Note: The optional attribute queryByParameter.responseElementGroupId was removed from the model.</assert>
   <assert test='not(msg:modifyCode)'>Note: The optional attribute queryByParameter.modifyCode was removed from the model.</assert>
   <assert test='not(msg:executionAndDeliveryTime)'>Note: The optional attribute queryByParameter.executionAndDeliveryTime was removed from the model.</assert>  
 </rule>
 
 </pattern>
 -->
	<!-- These schematron rules validate an PixV3 message Patient Registry Query by Indentifier PRPA_IN201310UV02 -->
	<pattern name='PRPA_IN201310UV02-errors' id='PRPA_IN201310UV02-errors'>
		<rule context='/msg:PRPA_IN201310UV02'>
			<assert test='msg:interactionId/@extension="PRPA_IN201310UV02"'>
      Error: the attribute PRPA_IN201310UV02/interactionId/@extension shall equal PRPA_IN201310UV02.
      See Table 3.45.4.4.2-5.
   </assert>
			<assert test='msg:processingModeCode/@code="T"'>
      Error: The attribute PRPA_IN201310UV02/processingModeCode/@code shall be set to T.
      See Table 3.45.4.4.2-5.
   </assert>
			<assert test='msg:acceptAckCode/@code="NE"'>
      Error: The attribute PRPA_IN201310UV02/acceptAckCode/@code shall be set to NE.
      See Table 3.45.4.4.2-5.
   </assert>
			<assert test='count(msg:receiver/msg:device) = 1'>
      Error: There shall be only one element PRPA_IN201310UV/receiver/device.
      See Table 3.45.4.4.2-5.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201310UV02/msg:controlActProcess'>
			<assert test='@moodCode="EVN"'>
      Error: The attribute PRPA_IN201310UV02/controlActProcess/moodCode shall be set EVN.
      See Table 3.45.4.4.2-5.
   </assert>
			<assert test='msg:code'>
      Error: The element PRPA_IN201310UV02/controlActProcess/code shall be present.
      See Table 3.45.4.4.2-5.
   </assert>
			<assert test='msg:code/@code ="PRPA_TE201310UV02"'>
      Error: The attribute PRPA_IN201310UV02/controlActProcess/code/@code shall have the value PRPA_TE201310UV02.
      See Table 3.45.4.4.2-5.
   </assert>
			<assert test='not(msg:subject/msg:registrationEvent/msg:inFullfilmentOf)'>
      Error: The element PRPA_IN201310UV02/controlActProcess/subject/registrationEvent/inFullfilmentOf shall not be present.
      See Table 3.45.4.4.2-5.
   </assert>
			<assert test='count(msg:subject/msg:registrationEvent) &lt; 2'>
      Error: There shall be zero or one element controlActProcess/subject/registrationEvent.
      See Table 3.45.4.4.2-5.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201310UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient/msg:providerOrganization'>
			<assert test='msg:id/@root'>
      Error: The patient/providerOrganization/id shall have only a root expressed as an ISO OID matching the id/@root attributes of the element patient.
      See Section 3.45.4.2.2.1.
   </assert>
			<assert test='matches(msg:id/@root,"^[0-2](\.(0|[1-9][0-9]*))*$")'>
      Error: The patient/providerOrganization/id shall have only a root expressed as an ISO OID matching the id/@root attributes of the element patient.
      See Section 3.45.4.2.2.1.
   </assert>
		</rule>
		<rule context='/msg:PRPA_IN201310UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient'>
			<assert test='(msg:patientPerson/msg:name/*) or string-length(msg:patientPerson/msg:name) > 0 or msg:patientPerson/msg:name/@nullFlavor ="NA"'>
      Error: Person.name must be non-null.
      See Table 3.45.4.2.2-3.
   </assert>
			<assert test='msg:id[@root or @extension]'>
      Error: Patient.id must be non-null.
      See Table 3.45.4.2.2-3.
   </assert>
		</rule>
	</pattern>
	<!--
 <pattern id='PRPA_IN201310UV02-note'>
 
 <rule context='/msg:PRPA_IN201310UV02'>   
   <assert test='not(msg:id/@root)'>Note: The attribute PRPA_IN201310UV02/id/@root should be a unique UUID.</assert>
   <assert test='not(msg:creationTime/@value)'>Note: The attribute PRPA_IN201310UV02/creationTime/@value should be generated for each message.</assert>   
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:custodian)'>Note: The class registrationEvent/custodian was removed.</assert>
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:author)'>Note: The class registrationEvent/authr was removed.</assert>
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:definition)'>Note: The class registrationEvent/definition was removed.</assert>
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:custodian)'>Note: The class registrationEvent/inFullfillmentOf was removed.</assert>
   <assert test='not(msg:controlActProcess/msg:subject/msg:registrationEvent/msg:replacement)'>Note: The class registrationEvent/replacementOf was removed.</assert>
</rule>
 
<rule context='/msg:PRPA_IN201310UV02/msg:controlActProcess/msg:subject/msg:registrationEvent/msg:subject1/msg:patient'>
   <assert test='not(msg:effectiveTime)'>Note: The optional attribute patient.effectiveTime was removed.</assert>
   <assert test='not(msg:patientNonPersonLivingSubject)'>Note: The optional attribute patient.patientNonPersonLivingSubject was removed.</assert>
   <assert test='not(msg:veryImportantPersonCode)'>Note: The optional attribute patient.veryImportantPersonCode was removed.</assert>   
   <assert test='not(msg:coveredPartyOf)'>Note: The optional attribute patient.coveredPartyOf was removed.</assert>   
   <assert test='not(msg:patientPerson/msg:asCitizen)'>Note: The optional attribute patientPerson.asCitizen was removed.</assert> 
   <assert test='not(msg:patientPerson/msg:asStudent)'>Note: The optional attribute patientPerson.asStudent was removed.</assert>
   <assert test='not(msg:patientPerson/msg:asEmployee)'>Note: The optional attribute patientPerson.asEmployee was removed.</assert>
   <assert test='not(msg:patientPerson/msg:asMember)'>Note: The optional attribute patientPerson.asMember was removed.</assert>      
   <assert test='not(msg:patientPerson/msg:asPatientOfOtherProvider)'>Note: The optional attribute patientPerson.asPatientOfOtherProvider was removed.</assert>   
 </rule>  
 
 </pattern>
-->
	<pattern name='QUQI_IN000003UV01-errors' id='QUQI_IN000003UV01-errors'>
		<rule context='/msg:QUQI_IN000003UV01 | /msg:QUQI_IN000003UV01_Cancel'>
			<assert test='msg:interactionId/@extension="QUQI_IN000003UV01"'>
      Error: The attribute QUQI_IN000003UV01/interactionId/@extension shall equal QUQI_IN000003UV01.
      See Table 3.47.4.3.2-1.
   </assert>
			<assert test='msg:processingModeCode/@code="T"'>
      Error: The attribute QUQI_IN000003UV01/processingModeCode/@code shall be set to T.
      See Table 3.47.4.3.2-1.
   </assert>
			<assert test='msg:acceptAckCode/@code="AL"'>
      Error: The attribute QUQI_IN000003UV01/acceptAckCode/@code shall be set to AL.
      See Table 3.47.4.3.2-1.
   </assert>
			<assert test='count(msg:receiver/msg:device) = 1'>
      Error: There shall be only one receiver device.
      See Table 3.47.4.3.2-1.
   </assert>
			<!-- 

QUQI_IN000003UV01 uses the Transmission wrapper MCCI_MT000300UV01.  That wrapper requires the existence of
the acknowledgement class.

-->
			<assert test='msg:acknowledgement/msg:typeCode/@code = "AA"'>
      Error: The QUQI_IN000003UV01/acknowledgement/typeCode/@code SHALL be set to AA.
      See Table 3.47.4.3.2-1.
   </assert>
			<assert test='msg:acknowledgement/msg:targetMessage/msg:id'>
      Error: The QUQI_IN000003UV01/acknowledgement/targetMessage/id SHALL be the message ID of the immediately preceding
      Query response message.
      See Table 3.47.4.3.2-1.
   </assert>
		</rule>
		<rule context='/msg:QUQI_IN000003UV01/msg:controlActProcess | /msg:QUQI_IN000003UV01_Cancel/msg:controlActProcess'>
			<assert test='msg:code/@code="PRPA_TE000003UV01"'>
      Error: The attribute QUQI_IN000003UV01/controlActProcess/code/@code SHALL have the trigger event code value PRPA_TE000003UV01.
      See Table 3.47.4.3.2-1.
   </assert>
		</rule>
		<rule context='/msg:QUQI_IN000003UV01/msg:controlActProcess/msg:queryContinuation | 
               /msg:QUQI_IN000003UV01_Cancel/msg:controlActProcess/msg:queryContinuation'>
			<assert test='msg:queryId'>
      Error: The QUQI_IN000003UV01/controlActProcess/queryContinuation/queryId SHALL be set to the original query identifier.
      See Table 3.47.4.3.2-1.
   </assert>
			<assert test='msg:statusCode[@code="aborted" or @code="waitContinuedQueryResponse"]'>
      Error: For Query Control Act Request Continuation/Cancellation Control Act, the statusCode defaults to 
      "waitContinuedQueryResponse".  The only other possible value is "aborted", indicating no more results are needed from the
      query fulfiller.
      See Table O.2.4-4.
   </assert>
		</rule>
	</pattern>
	<pattern name='QUQI_IN000003UV01-warnings' id='QUQI_IN000003UV01-warnings'>
		<rule context='/msg:QUQI_IN000003UV01/msg:controlActProcess | /msg:QUQI_IN000003UV01_Cancel/msg:controlActProcess'>
			<assert test='@moodCode="RQO"'>
      Warning: According to table Table O.2.4-4, the attribute QUQI_IN000003UV01/controlActProcess/@moodCode shall be set
      to RQO (Request-Order).
      However, this violates the version of the QUQI_IN000003UV01 schema and HL7 model pointed to by the IHE ITI specification
      which forces this element to be an EVN (Event).
      This discrepancy has been documented in a Change Proposal (CP-ITI-455).  This warning message may change upon the resolution
      of that Change Proposal.
   </assert>
		</rule>
	</pattern>
</schema>