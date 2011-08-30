/*
 * Copyright 2011 the original author or authors.
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
package org.openehealth.ipf.commons.ihe.hl7v3.iti47;

import groovy.util.slurpersupport.GPathResult

import org.openehealth.ipf.commons.ihe.ws.cxf.audit.WsAuditDataset
import static org.openehealth.ipf.commons.ihe.hl7v3.Hl7v3Utils.slurp
import org.openehealth.ipf.commons.ihe.ws.utils.SoapUtils
import org.openehealth.ipf.commons.ihe.core.atna.AuditorManager
import org.openehealth.ipf.commons.ihe.hl7v3.Hl7v3AuditStrategy
import org.openehealth.ipf.commons.ihe.hl7v3.Hl7v3AuditDataset

/**
 * @author Dmytro Rud
 */
class Iti47AuditStrategy extends Hl7v3AuditStrategy {

    private static final String[] NECESSARY_FIELD_NAMES = [
            'EventOutcomeCode',
            'UserId',
            'ServiceEndpointUrl',
            /* 'PatientIds', */
            'RequestPayload',
    ]


    Iti47AuditStrategy(boolean serverSide, boolean allowIncompleteAudit) {
        super(serverSide, allowIncompleteAudit)
    }
    

    @Override
    void enrichDatasetFromRequest(Object request, WsAuditDataset auditDataset0) {
        Hl7v3AuditDataset auditDataset = (Hl7v3AuditDataset) auditDataset0
        GPathResult xml = slurp((String) request)

        // patient IDs from request
        def patientIds = [] as Set<String>
        addPatientIds(xml.controlActProcess.queryByParameter.parameterList.livingSubjectId.value, patientIds)
        auditDataset.patientIds = patientIds.toArray() ?: null

        // dump of the "queryByParameter" element
        auditDataset.requestPayload = SoapUtils.extractNonEmptyElement((String) request, 'queryByParameter')
    }


    @Override
    void enrichDatasetFromResponse(Object response, WsAuditDataset auditDataset0) {
        Hl7v3AuditDataset auditDataset = (Hl7v3AuditDataset) auditDataset0
        super.enrichDatasetFromResponse(response, auditDataset)
        
        GPathResult xml = slurp((String) response)

        // patient IDs from response
        def patientIds = [] as Set<String>
        addPatientIds(xml.controlActProcess.subject.registrationEvent.subject1.patient.id, patientIds)
        if (auditDataset.patientIds) {
            patientIds.addAll(auditDataset.patientIds)
        }
        auditDataset.patientIds = patientIds.toArray() ?: null
    }


    @Override
    void doAudit(WsAuditDataset auditDataset) {
        AuditorManager.hl7v3Auditor.auditIti47(
                serverSide,
                auditDataset.eventOutcomeCode,
                auditDataset.userId,
                auditDataset.userName,
                auditDataset.serviceEndpointUrl,
                auditDataset.clientIpAddress,
                auditDataset.requestPayload,
                auditDataset.patientIds
        )
    }


    @Override
    String[] getNecessaryAuditFieldNames() {
        return NECESSARY_FIELD_NAMES
    }

}
