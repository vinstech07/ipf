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
package org.openehealth.ipf.commons.ihe.pixpdqv3.translation

import org.junit.BeforeClass
import org.junit.Test
import org.openehealth.ipf.commons.ihe.pixpdq.definitions.CustomModelClassUtils
import org.openehealth.ipf.commons.ihe.pixpdqv3.translation.Hl7TranslationTestContainer
import org.openehealth.ipf.commons.ihe.hl7v3.Hl7v3Validator
import ca.uhn.hl7v2.parser.Parser
import org.openehealth.ipf.modules.hl7dsl.MessageAdapter
import org.openehealth.ipf.modules.hl7dsl.MessageAdapters
import org.custommonkey.xmlunit.Diff
import org.openehealth.ipf.commons.ihe.hl7v3.Hl7v3ValidationProfiles
import org.openehealth.ipf.commons.ihe.pixpdq.MessageAdapterValidator
import static junit.framework.Assert.assertTrue

/**
 * 
 * @author Boris Stanojevic
 *
 */
class PixFeedSourceTranslatorTest extends Hl7TranslationTestContainer {

    static def parser
    
    @BeforeClass
    static void setUpClass() {
        doSetUp('pixsource',
                null,
                new PixFeedRequest2to3Translator())

        parser = CustomModelClassUtils.createParser('pixsource', '2.5')
    }

	@Test
	void testCreateMessage() {
		doTestV2toV3RequestTranslation('A01', 8, 44, parser)
        doTestV2toV3RequestTranslation('A04', 8, 44, parser)
	}

	@Test
	void testUpdateMessage() {
		doTestV2toV3RequestTranslation('A08', 8, 44, parser)
	}

	@Test
	void testMergeMessage() {
		doTestV2toV3RequestTranslation('A40', 8, 44, parser)
	}

    @Test
	void testNotSupportedMessage() throws Exception {
		String v2request = getFileContent('A10', false, true)
        MessageAdapter msg = MessageAdapters.make(parser, v2request)
        try{
            v2tov3Translator.translateV2toV3(msg)
        } catch (Exception e){
            assertTrue(e.message.contains('Not supported HL7 message event'))
        }
	}
}
