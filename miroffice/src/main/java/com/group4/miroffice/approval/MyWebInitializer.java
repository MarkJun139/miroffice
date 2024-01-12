package com.group4.miroffice.approval;

import java.util.EnumSet;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.filter.HiddenHttpMethodFilter;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;

public class MyWebInitializer implements WebApplicationInitializer {
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
    //생략
		servletContext.addFilter("httpMethodFilter", HiddenHttpMethodFilter.class)
				.addMappingForUrlPatterns(EnumSet.allOf(DispatcherType.class), false, "/*");
    //생략
	}
}