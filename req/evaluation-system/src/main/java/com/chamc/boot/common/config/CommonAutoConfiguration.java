package com.chamc.boot.common.config;

import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import com.chamc.boot.common.model.Server;
import com.chamc.boot.common.utils.ServerUtils;
import com.chamc.boot.common.utils.SpringUtils;
import com.chamc.utils.core.SpringContextHolder;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class CommonAutoConfiguration {

    public @Bean Server server() {
        return ServerUtils.getServer();
    }

    public @Bean SpringContextHolder springContextHolder() {
        return new SpringContextHolder();
    }

    public @Bean ApplicationContextAware springUtilsInitializer() {
        return SpringUtils::setContext;
    }

    public @Bean ChamcCommonProperties chamcCommonProperties() {
        return new ChamcCommonProperties();
    }

    public @Bean TempFilePathListener tempFilePathListener() {
        return new TempFilePathListener();
    }

    @Order(2)
    static class TempFilePathListener implements ApplicationListener<ApplicationReadyEvent> {
        /**
         * 监听上下文准备就绪事件，设置poi临时文件目录为指定目录
         */
        @Override
        public void onApplicationEvent(ApplicationReadyEvent event) {
            String filePath = event.getApplicationContext().getEnvironment().getProperty("chamc.common.poi.tmp-path");
//            if (StringUtils.isNotBlank(filePath)) {
//                log.info("set poi temp file path to:" + filePath);
//                File dir = new File(filePath);
//                dir.mkdir();
//                TempFile.setTempFileCreationStrategy(new TempFile.DefaultTempFileCreationStrategy(dir));
//            }
        }
    }

    @ConfigurationProperties("chamc.common.poi")
    public @Data class ChamcCommonProperties {
        /**
         * poi临时文件的目录，可以使用相对路径如./poi-temp，也可使用绝对路径/home/platform/software/poi-temp
         * 开发时使用windows环境，部署时使用linux环境，建议指定相对路径
         */
        private String tmpPath;
    }
}
