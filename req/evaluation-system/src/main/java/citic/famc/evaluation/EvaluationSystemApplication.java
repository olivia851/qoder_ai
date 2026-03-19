package citic.famc.evaluation;

import com.ulisesbocchio.jasyptspringboot.JasyptSpringBootAutoConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Import;

@Slf4j
@SpringBootApplication
@EnableFeignClients(basePackages = {"citic.famc"})
@Import(JasyptSpringBootAutoConfiguration.class)
public class EvaluationSystemApplication {

    public static void main(String[] args) {
        long startTime = System.currentTimeMillis();
        log.info("=========== EvaluationSystemApplication is starting ===========");

        try {
            ConfigurableApplicationContext context = SpringApplication.run(EvaluationSystemApplication.class, args);

            long cost = (System.currentTimeMillis() - startTime) / 1000;

            String port = context.getEnvironment().getProperty("server.port", "8080");
            String path = context.getEnvironment().getProperty("server.servlet.context-path", "");

            log.info("✅ Started successfully in {} s", cost);
            log.info("🚀 Swagger UI: http://localhost:{}{}/swagger-ui/index.html", port, path);

        } catch (Exception e) {
            log.error("❌ Application startup failed!", e);
            System.exit(1);
        }
    }

}