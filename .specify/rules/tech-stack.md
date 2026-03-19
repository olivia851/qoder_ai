# Technology Stack Enforcement Rule
**Rule Version**: 1.0
**Parent Constitution**: v1.1.0
**Enforcement Level**: MANDATORY

## Scope
This rule enforces the technology stack requirements defined in the project constitution.

## Backend Requirements
- **Framework**: Spring Boot 2.7.x or 3.x ONLY
- **Architecture**: Standard layered architecture (Controller, Service, Mapper/DAO, Entity)
- **Forbidden**: Node.js, Go, Python backend services

## Frontend Requirements
- **Primary Framework**: Vue2 ONLY
- **State Management**: Vuex preferred
- **Exception**: React allowed ONLY for `type: micro-frontend-plugin` or `project_category: data-vis` projects
- **Component Library**: Element UI REQUIRED

## Database Requirements
- **Primary**: TiDB (MySQL compatible) ONLY
- **Exception**: Oracle ONLY for legacy system migration/integration
- **New Tables**: MUST be created in TiDB
- **Connection Pool**: Druid or HikariCP REQUIRED

## Enforcement Mechanism
- AI MUST flag `[TECH_STACK_VIOLATION]` when detecting non-compliant technologies
- Violations MUST be rejected during Plan phase
- Architecture committee exemption required for exceptions

## Compliance Checking
- `/plan` and `/analyze` commands MUST validate technology stack compliance
- All generated code MUST adhere to these requirements
- Manual override requires explicit user declaration of exception conditions