/*
 * Copyright 2009 the original author or authors.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *     
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.openehealth.ipf.platform.camel.ihe.pixpdqv3.extend;


import org.apache.camel.model.ProcessorDefinition;
import org.openehealth.ipf.commons.ihe.pixpdqv3.PixPdqV3Validator;
import org.openehealth.ipf.commons.ihe.pixpdqv3.translation.Hl7TranslatorV2toV3;
import org.openehealth.ipf.commons.ihe.pixpdqv3.translation.Hl7TranslatorV3toV2;
import org.openehealth.ipf.modules.hl7dsl.MessageAdapter;
import org.openehealth.ipf.platform.camel.core.model.ValidatorAdapterDefinition;
import org.openehealth.ipf.platform.camel.core.util.Exchanges;

/**
 * HL7 v3 DSL extensions for usage in a {@link org.apache.camel.builder.RouteBuilder} using the {@code use} keyword.
 * @author Jens Riemschneider
 * @author Dmytro Rud
 */
class PixPdqV3Extension {

     /**
      * Name of the Camel exchange property in which original   
      * request messages will be saved before translation.
      */
     public static final String HL7V3_ORIGINAL_REQUEST_PROPERTY = "hl7v3.original.request";

     /**
      * Correspondence between transaction number and HL7 v3 request message type.   
      */
     private static final Map REQUEST_TYPES = [
         44 : ['PRPA_IN201301UV02', 'PRPA_IN201302UV02', 'PRPA_IN201304UV02'],
         45 : ['PRPA_IN201309UV02'],
         46 : ['PRPA_IN201302UV02'],
         47 : ['PRPA_IN201305UV02', 'QUQI_IN000003UV01', 'QUQI_IN000003UV01_Cancel'],
     ];
      
     /**
      * Correspondence between transaction number and HL7 v3 response message type.   
      */
     private static final Map RESPONSE_TYPES = [
         44 : ['MCCI_IN000002UV01'],
         45 : ['PRPA_IN201310UV02'],
         46 : ['MCCI_IN000002UV01'],
         47 : ['PRPA_IN201306UV02', 'MCCI_IN000002UV01'],
     ];

     
     /**
      * Validates an ITI-44 request
      * @ipfdoc IHE Support#validation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ValidatorAdapterDefinition iti44Request(ValidatorAdapterDefinition self) {
         return validationLogic(self, 44, true);
     }
     
     /**
      * Validates an ITI-44 response
      * @ipfdoc IHE Support#validation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ValidatorAdapterDefinition iti44Response(ValidatorAdapterDefinition self) {
         return validationLogic(self, 44, false);
     }
     
     /**
      * Validates an ITI-45 request
      * @ipfdoc IHE Support#validation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ValidatorAdapterDefinition iti45Request(ValidatorAdapterDefinition self) {
         return validationLogic(self, 45, true);
     }
     
     /**
      * Validates an ITI-45 response
      * @ipfdoc IHE Support#validation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ValidatorAdapterDefinition iti45Response(ValidatorAdapterDefinition self) {
         return validationLogic(self, 45, false);
     }
     
     /**
      * Validates an ITI-46 request
      * @ipfdoc IHE Support#validation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ValidatorAdapterDefinition iti46Request(ValidatorAdapterDefinition self) {
         return validationLogic(self, 46, true);
     }
     
     /**
      * Validates an ITI-46 response
      * @ipfdoc IHE Support#validation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ValidatorAdapterDefinition iti46Response(ValidatorAdapterDefinition self) {
         return validationLogic(self, 46, false);
     }
     
     /**
      * Validates an ITI-47 request
      * @ipfdoc IHE Support#validation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ValidatorAdapterDefinition iti47Request(ValidatorAdapterDefinition self) {
         return validationLogic(self, 47, true);
     }
     
     /**
      * Validates an ITI-47 response
      * @ipfdoc IHE Support#validation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ValidatorAdapterDefinition iti47Response(ValidatorAdapterDefinition self) {
         return validationLogic(self, 47, false);
     }
     
     private static ValidatorAdapterDefinition validationLogic(
             ValidatorAdapterDefinition self, 
             int transaction,
             boolean request) 
     {
         self.setValidator(new PixPdqV3Validator());
         self.staticProfile(request ? REQUEST_TYPES[transaction] : RESPONSE_TYPES[transaction]);
         return (ValidatorAdapterDefinition)self.input {
             it.in.getBody(String.class)
         };
     }

     
     /**
      * Translates a HL7v3 message to HL7v2 using the given translator.
      * @ipfdoc IHE Support#translation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ProcessorDefinition translateHL7v3toHL7v2(
             ProcessorDefinition self, 
             Hl7TranslatorV3toV2 translator) 
     {
         return self.process {
             MessageAdapter initial = it.getProperty(HL7V3_ORIGINAL_REQUEST_PROPERTY, MessageAdapter.class);
             String xmlText = it.in.getBody(String.class);
             it.setProperty(HL7V3_ORIGINAL_REQUEST_PROPERTY, xmlText);
             Exchanges.resultMessage(it).body = translator.translateV3toV2(xmlText, initial);
         };
     }
     
     /**
      * Translates a HL7v2 message to HL7v3 using the given translator.
      * @ipfdoc IHE Support#translation hl7v3
      * @dsl platform-camel-ihe-pixpdqv3
      */
     public static ProcessorDefinition translateHL7v2toHL7v3(
             ProcessorDefinition self, 
             Hl7TranslatorV2toV3 translator) 
     {
         return self.process {
             String initial = it.getProperty(HL7V3_ORIGINAL_REQUEST_PROPERTY, String.class);
             MessageAdapter msg = it.in.getBody(MessageAdapter.class);
             it.setProperty(HL7V3_ORIGINAL_REQUEST_PROPERTY, msg);
             Exchanges.resultMessage(it).body = translator.translateV2toV3(msg, initial);
         };
     }
}