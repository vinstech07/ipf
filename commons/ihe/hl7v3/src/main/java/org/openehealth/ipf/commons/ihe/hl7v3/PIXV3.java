/*
 * Copyright 2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.openehealth.ipf.commons.ihe.hl7v3;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.openehealth.ipf.commons.ihe.core.InteractionId;
import org.openehealth.ipf.commons.ihe.core.InteractionProfile;
import org.openehealth.ipf.commons.ihe.core.atna.AuditStrategy;
import org.openehealth.ipf.commons.ihe.hl7v3.Hl7v3ValidationProfile.Row;
import org.openehealth.ipf.commons.ihe.hl7v3.iti44.Iti44ClientAuditStrategy;
import org.openehealth.ipf.commons.ihe.hl7v3.iti44.Iti44PixPortType;
import org.openehealth.ipf.commons.ihe.hl7v3.iti44.Iti44ServerAuditStrategy;
import org.openehealth.ipf.commons.ihe.hl7v3.iti44.Iti44XdsPortType;
import org.openehealth.ipf.commons.ihe.hl7v3.iti45.Iti45ClientAuditStrategy;
import org.openehealth.ipf.commons.ihe.hl7v3.iti45.Iti45PortType;
import org.openehealth.ipf.commons.ihe.hl7v3.iti45.Iti45ServerAuditStrategy;
import org.openehealth.ipf.commons.ihe.hl7v3.iti46.Iti46ClientAuditStrategy;
import org.openehealth.ipf.commons.ihe.hl7v3.iti46.Iti46PortType;
import org.openehealth.ipf.commons.ihe.hl7v3.iti46.Iti46ServerAuditStrategy;

import javax.xml.namespace.QName;
import java.util.Arrays;
import java.util.List;

/**
 * @author Christian Ohr
 * @since 3.2
 */
public class PIXV3 implements InteractionProfile {

    @SuppressWarnings("unchecked")
    @AllArgsConstructor
    public enum Interactions implements Hl7v3InteractionId {

        ITI_44_PIX("pixv3-iti44",
                "Patient Identity Feed HL7 V3",
                false,
                ITI44_PIX_WS_CONFIG) {
            @Override
            public AuditStrategy<Hl7v3AuditDataset> getClientAuditStrategy() {
                return Iti44ClientAuditStrategy.getInstance();
            }

            @Override
            public AuditStrategy<Hl7v3AuditDataset> getServerAuditStrategy() {
                return Iti44ServerAuditStrategy.getInstance();
            }
        },

        ITI_44_XDS("xds-iti44",
                "Patient Identity Feed HL7 V3",
                false,
                ITI44_XDS_WS_CONFIG) {
            @Override
            public AuditStrategy<Hl7v3AuditDataset> getClientAuditStrategy() {
                return Iti44ClientAuditStrategy.getInstance();
            }

            @Override
            public AuditStrategy<Hl7v3AuditDataset> getServerAuditStrategy() {
                return Iti44ServerAuditStrategy.getInstance();
            }
        },

        ITI_45("pixv3-iti45",
                "PIXV3 Query",
                true,
                ITI45_WS_CONFIG) {
            @Override
            public AuditStrategy<Hl7v3AuditDataset> getClientAuditStrategy() {
                return Iti45ClientAuditStrategy.getInstance();
            }

            @Override
            public AuditStrategy<Hl7v3AuditDataset> getServerAuditStrategy() {
                return Iti45ServerAuditStrategy.getInstance();
            }
        },

        ITI_46("pixv3-iti46",
                "PIXV3 Update Notification",
                false,
                ITI46_WS_CONFIG) {
            @Override
            public AuditStrategy<Hl7v3AuditDataset> getClientAuditStrategy() {
                return Iti46ClientAuditStrategy.getInstance();
            }

            @Override
            public AuditStrategy<Hl7v3AuditDataset> getServerAuditStrategy() {
                return Iti46ServerAuditStrategy.getInstance();
            }
        };

        @Getter private String name;
        @Getter private String description;
        @Getter private boolean query;
        @Getter private Hl7v3WsTransactionConfiguration wsTransactionConfiguration;
    }

    @Override
    public List<InteractionId> getInteractionIds() {
        return Arrays.asList(Interactions.values());
    }

    private static final String NS_URI_PIX = "urn:ihe:iti:pixv3:2007";
    private static final String NS_URI_XDS = "urn:ihe:iti:xds-b:2007";

    private static final Hl7v3ValidationProfile iti44RequestValidationProfile = new Hl7v3ValidationProfile(
            new Row("PRPA_IN201301UV02", Row.DEFAULT_XSD, Row.GAZELLE_PIXPDQV3_SCHEMATRON),
            new Row("PRPA_IN201302UV02", Row.DEFAULT_XSD, Row.GAZELLE_PIXPDQV3_SCHEMATRON),
            new Row("PRPA_IN201304UV02", Row.DEFAULT_XSD, Row.GAZELLE_PIXPDQV3_SCHEMATRON)
    );

    private static final Hl7v3ValidationProfile iti44ResponseValidationProfile = new Hl7v3ValidationProfile(
            new Row("MCCI_IN000002UV01", Row.DEFAULT_XSD, Row.GAZELLE_PIXPDQV3_SCHEMATRON)
    );

    private static final Hl7v3ValidationProfile iti45RequestValidationProfile = new Hl7v3ValidationProfile(
            new Row("PRPA_IN201309UV02", Row.DEFAULT_XSD, Row.GAZELLE_PIXPDQV3_SCHEMATRON)
    );

    private static final Hl7v3ValidationProfile iti45ResponseValidationProfile = new Hl7v3ValidationProfile(
            new Row("PRPA_IN201310UV02", Row.DEFAULT_XSD, Row.GAZELLE_PIXPDQV3_SCHEMATRON)
    );

    private static final Hl7v3ValidationProfile iti46RequestValidationProfile = new Hl7v3ValidationProfile(
            new Row("PRPA_IN201302UV02", Row.DEFAULT_XSD, null)
    );

    private static final Hl7v3ValidationProfile iti46ResponseValidationProfile = new Hl7v3ValidationProfile(
            new Row("MCCI_IN000002UV01", Row.DEFAULT_XSD, Row.GAZELLE_PIXPDQV3_SCHEMATRON)
    );

    private static final Hl7v3WsTransactionConfiguration ITI44_PIX_WS_CONFIG = new Hl7v3WsTransactionConfiguration(
            new QName(NS_URI_PIX, "PIXManager_Service", "ihe"),
            Iti44PixPortType.class,
            new QName(NS_URI_PIX, "PIXManager_Binding_Soap12", "ihe"),
            false,
            "wsdl/iti44/iti44-pix-raw.wsdl",
            "MCCI_IN000002UV01",
            null,
            false,
            false,
            iti44RequestValidationProfile,
            iti44ResponseValidationProfile);

    private final static Hl7v3WsTransactionConfiguration ITI44_XDS_WS_CONFIG = new Hl7v3WsTransactionConfiguration(
            new QName(NS_URI_XDS, "DocumentRegistry_Service", "ihe"),
            Iti44XdsPortType.class,
            new QName(NS_URI_XDS, "DocumentRegistry_Binding_Soap12", "ihe"),
            false,
            "wsdl/iti44/iti44-xds-raw.wsdl",
            "MCCI_IN000002UV01",
            null,
            false,
            false,
            iti44RequestValidationProfile,
            iti44ResponseValidationProfile);

    private static final Hl7v3WsTransactionConfiguration ITI45_WS_CONFIG = new Hl7v3WsTransactionConfiguration(
            new QName(NS_URI_PIX, "PIXManager_Service", "ihe"),
            Iti45PortType.class,
            new QName(NS_URI_PIX, "PIXManager_Binding_Soap12", "ihe"),
            false,
            "wsdl/iti45/iti45-raw.wsdl",
            "PRPA_IN201310UV02",
            "PRPA_TE201310UV02",
            false,
            false,
            iti45RequestValidationProfile,
            iti45ResponseValidationProfile);

    private final static Hl7v3WsTransactionConfiguration ITI46_WS_CONFIG = new Hl7v3WsTransactionConfiguration(
            new QName(NS_URI_PIX, "PIXConsumer_Service", "ihe"),
            Iti46PortType.class,
            new QName(NS_URI_PIX, "PIXConsumer_Binding_Soap12", "ihe"),
            false,
            "wsdl/iti46/iti46-raw.wsdl",
            "MCCI_IN000002UV01",
            null,
            false,
            false,
            iti46RequestValidationProfile,
            iti46ResponseValidationProfile);


}