// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.catalog;

import com.raze.coleadmin.catalog.EstatusInscripcion;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect EstatusInscripcion_Roo_Json {
    
    public String EstatusInscripcion.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String EstatusInscripcion.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static EstatusInscripcion EstatusInscripcion.fromJsonToEstatusInscripcion(String json) {
        return new JSONDeserializer<EstatusInscripcion>()
        .use(null, EstatusInscripcion.class).deserialize(json);
    }
    
    public static String EstatusInscripcion.toJsonArray(Collection<EstatusInscripcion> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String EstatusInscripcion.toJsonArray(Collection<EstatusInscripcion> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<EstatusInscripcion> EstatusInscripcion.fromJsonArrayToEstatusInscripcions(String json) {
        return new JSONDeserializer<List<EstatusInscripcion>>()
        .use("values", EstatusInscripcion.class).deserialize(json);
    }
    
}
