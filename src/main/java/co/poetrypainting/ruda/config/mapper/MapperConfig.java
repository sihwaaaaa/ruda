package co.poetrypainting.ruda.config.mapper;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;

@Configuration
@RequiredArgsConstructor
@MapperScan(basePackages = "co.poetrypainting.ruda.dao", annotationClass = Repository.class)
public class MapperConfig {
}

