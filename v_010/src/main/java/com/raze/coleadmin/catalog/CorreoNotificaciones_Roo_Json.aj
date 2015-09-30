// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.catalog;

import com.raze.coleadmin.catalog.CorreoNotificaciones;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CorreoNotificaciones_Roo_Json {
    
    public String CorreoNotificaciones.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String CorreoNotificaciones.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static CorreoNotificaciones CorreoNotificaciones.fromJsonToCorreoNotificaciones(String json) {
        return new JSONDeserializer<CorreoNotificaciones>()
        .use(null, CorreoNotificaciones.class).deserialize(json);
    }
    
    public static String CorreoNotificaciones.toJsonArray(Collection<CorreoNotificaciones> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String CorreoNotificaciones.toJsonArray(Collection<CorreoNotificaciones> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<CorreoNotificaciones> CorreoNotificaciones.fromJsonArrayToCorreoNotificacioneses(String json) {
        return new JSONDeserializer<List<CorreoNotificaciones>>()
        .use("values", CorreoNotificaciones.class).deserialize(json);
    }
    
}
