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
package org.openehealth.ipf.commons.ihe.xds.core.transform.requests.query;

import org.openehealth.ipf.commons.ihe.xds.core.ebxml.EbXMLAdhocQueryRequest;
import org.openehealth.ipf.commons.ihe.xds.core.requests.query.FindDocumentsByReferenceIdQuery;

import static org.openehealth.ipf.commons.ihe.xds.core.transform.requests.QueryParameter.DOC_ENTRY_REFERENCE_IDS;

/**
 * Transforms between a {@link FindDocumentsByReferenceIdQuery} and {@link EbXMLAdhocQueryRequest}.
 * @author Dmytro Rud
 */
public class FindDocumentsByReferenceIdQueryTransformer extends FindDocumentsQueryTransformer<FindDocumentsByReferenceIdQuery> {

    @Override
    public void toEbXML(FindDocumentsByReferenceIdQuery query, EbXMLAdhocQueryRequest ebXML) {
        if (query == null || ebXML == null) {
            return;
        }

        super.toEbXML(query, ebXML);
        QuerySlotHelper slots = new QuerySlotHelper(ebXML);
        slots.fromReferenceIdQueryList(DOC_ENTRY_REFERENCE_IDS, query.getReferenceIds());
    }


    public void fromEbXML(FindDocumentsByReferenceIdQuery query, EbXMLAdhocQueryRequest ebXML) {
        if (query == null || ebXML == null) {
            return;
        }

        super.fromEbXML(query, ebXML);
        QuerySlotHelper slots = new QuerySlotHelper(ebXML);
        query.setReferenceIds(slots.toReferenceIdQueryList(DOC_ENTRY_REFERENCE_IDS));
    }
}