package com.naturamity.parsing;

import freemarker.template.Configuration;
import freemarker.template.TemplateExceptionHandler;

import java.io.File;
import java.io.IOException;

public class FreemarkerConfiguration {

    private static Configuration configuration = null;

    public static Configuration get() throws IOException {
        if(configuration != null) return configuration;
        configuration = new Configuration(Configuration.VERSION_2_3_31);
        configuration.setDirectoryForTemplateLoading(new File("./resources/templates"));
        configuration.setDefaultEncoding("UTF-8");
        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
        configuration.setFallbackOnNullLoopVariable(true);
        return configuration;
    }
}
