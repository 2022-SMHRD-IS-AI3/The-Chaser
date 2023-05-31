package com.wasp.chaser.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {
   private static final Logger log = LoggerFactory.getLogger(CommonExceptionAdvice.class);

   @ExceptionHandler(Exception.class)
   public String except(Exception ex, Model model) {
      log.error("Exceiption...........{}", ex);

      model.addAttribute("exception", ex);

      log.info("model................{}", model);

      return "error_page";
   }
}