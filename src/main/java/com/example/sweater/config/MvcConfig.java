package com.example.sweater.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//Класс который содержит конфигурацию WEB слоя

@Configuration
public class MvcConfig implements WebMvcConfigurer {
    //Чтобы раздавать контент(Файл)
    @Value("${upload.path}")
    private String uploadPath;


    public void addViewControllers(ViewControllerRegistry registry){
        registry.addViewController("/login").setViewName("login");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/**")
                .addResourceLocations("file:" + uploadPath + "/");
        //Значит что при переходе в браузере на /img/** сервер будет
        //перенаправлять все запросы на ресурс локейшен
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
        //Означает что ресурсы будут искаться не в файловой системе а в дереве проекта
    }
}
