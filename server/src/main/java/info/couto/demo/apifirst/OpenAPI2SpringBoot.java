package info.couto.demo.apifirst;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class OpenAPI2SpringBoot {

  public static void main(String[] args) {
    new SpringApplication(OpenAPI2SpringBoot.class).run(args);
  }



  public static ConfigurableApplicationContext run(String... arg0) {
    return new SpringApplication(OpenAPI2SpringBoot.class).run(arg0);
  }
}
