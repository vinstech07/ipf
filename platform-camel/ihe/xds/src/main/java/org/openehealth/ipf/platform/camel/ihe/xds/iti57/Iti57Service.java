/*
 * Copyright 2013 the original author or authors.
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
package org.openehealth.ipf.platform.camel.ihe.xds.iti57;

import org.openehealth.ipf.commons.ihe.xds.core.responses.ErrorCode;
import org.openehealth.ipf.commons.ihe.xds.core.stub.ebrs30.lcm.SubmitObjectsRequest;
import org.openehealth.ipf.commons.ihe.xds.core.stub.ebrs30.rs.RegistryResponseType;
import org.openehealth.ipf.commons.ihe.xds.iti57.Iti57PortType;
import org.openehealth.ipf.platform.camel.ihe.xds.XdsRegistryRequestService;

/**
 * Service implementation for the IHE ITI-57 transaction (Update Document Set).
 * <p>
 * This implementation delegates to a Camel consumer by creating an exchange.
 *
 * @author Boris Stanojevic
 */
public class Iti57Service extends XdsRegistryRequestService<SubmitObjectsRequest> implements Iti57PortType {

    @Override
    public RegistryResponseType documentRegistryUpdateDocumentSet(SubmitObjectsRequest body) {
        return processRequest(body);
    }

    @Override
    protected ErrorCode getDefaultMetadataError() {
        return ErrorCode.METADATA_UPDATE_ERROR;
    }
    
    
}
