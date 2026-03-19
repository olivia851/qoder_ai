# Technology Stack & Architecture Rules
**Version**: 1.0 (Strict Enforcement)

> **适用范围**：本规则定义了项目的技术边界。
> **AI 指令**：在执行 /plan (设计方案) 和 /analyze (代码分析) 时，必须以此为硬性约束。

## 1. 后端架构 (Backend)
- **核心框架**：必须使用 **Spring Boot** (推荐版本 2.7.x 或 3.x)。
- **编码规范**：遵循标准分层架构 (Controller, Service, Mapper/DAO, Entity)。
- **严禁**：严禁引入 Node.js, Go 或 Python 等异构后端服务。

## 2. 前端架构 (Frontend)
- **主框架**：必须使用 **Vue2** 作为 UI 开发框架。
- **状态管理**：优先使用 Vuex。
- **特定例外 (React)**：
    - 仅当项目标记为 `type: micro-frontend-plugin` 或 `project_category: data-vis` 时，允许使用 React。
    - 除非用户明确声明上述条件，否则默认拒绝 React 方案。

## 3. 数据库规范 (Database)
- **主数据库**：必须使用 **TiDB** (兼容 MySQL 协议)。
- **特定例外 (Oracle)**：
    - 仅限从 **Oracle 遗留系统** 进行数据迁移或与之集成的模块使用 Oracle。
    - 所有新业务表必须创建在 TiDB 中。
- **连接池**：统一使用 Druid 或 HikariCP。

## 4. 冲突处理 (Conflict Resolution)
- 如果 `plan.md` 中出现的组件或技术不符合上述要求，AI 必须在 Plan 阶段抛出 **[TECH_STACK_VIOLATION]** 警告并停止生成代码，直到用户修正或提供架构委员会豁免。 [2]