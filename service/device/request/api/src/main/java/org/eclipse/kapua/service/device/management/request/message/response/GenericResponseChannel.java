/*******************************************************************************
 * Copyright (c) 2017 Eurotech and/or its affiliates and others
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Eurotech - initial API and implementation
 *******************************************************************************/
package org.eclipse.kapua.service.device.management.request.message.response;

import org.eclipse.kapua.service.device.management.request.GenericRequestXmlRegistry;
import org.eclipse.kapua.service.device.management.response.KapuaResponseChannel;

import javax.xml.bind.annotation.XmlType;

@XmlType(factoryClass = GenericRequestXmlRegistry.class, factoryMethod = "newResponseChannel")
public interface GenericResponseChannel extends KapuaResponseChannel {

}
