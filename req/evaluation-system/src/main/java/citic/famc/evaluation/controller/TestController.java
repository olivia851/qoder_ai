package citic.famc.evaluation.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 测试接口控制器
 * 用于验证服务启动状态及基本通信
 */
@Slf4j
@RestController
@RequestMapping("/api/test")
public class TestController {

    /**
     * 健康检查接口 (GET)
     * URL: GET /api/test/health
     */
    @GetMapping("/health")
    public Map<String, Object> healthCheck() {
        log.info("收到健康检查请求");
        Map<String, Object> response = new HashMap<>();
        response.put("status", "UP");
        response.put("timestamp", LocalDateTime.now());
        response.put("service", "evaluation-system");
        response.put("message", "系统运行正常");
        return response;
    }

    /**
     * 简单回声测试接口 (POST)
     * URL: POST /api/test/echo
     * Body: JSON (例如: {"name": "test", "value": 123})
     */
    @PostMapping("/echo")
    public Map<String, Object> echo(@RequestBody(required = false) Map<String, Object> payload) {
        log.info("收到回声测试请求，内容: {}", payload);

        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("received_at", LocalDateTime.now());
        response.put("original_data", payload == null ? "No data provided" : payload);
        response.put("note", "Echo successful from Evaluation System");

        return response;
    }

    /**
     * 模拟业务异常测试 (GET)
     * URL: GET /api/test/error
     * 用于测试全局异常处理或日志记录
     */
    @GetMapping("/error")
    public String triggerError() {
        log.warn("手动触发测试异常");
        throw new RuntimeException("这是一个用于测试的故意抛出的异常");
    }
}