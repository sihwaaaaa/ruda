package co.poetrypainting.ruda;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling()
@SpringBootApplication
public class RudaApplication {

	public static void main(String[] args) {
		SpringApplication.run(RudaApplication.class, args);
	}

}
