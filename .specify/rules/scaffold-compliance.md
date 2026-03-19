# Scaffold Compliance Rule
**Rule Version**: 1.0
**Parent Constitution**: v1.2.0
**Enforcement Level**: MANDATORY

## Scope
This rule enforces mandatory scaffold usage as defined in the project constitution.

## Scaffold Requirements

### Backend Scaffold (@req/evaluation-system)
- **MUST** inherit from chamc-boot-starter-parent:2.9.0.RELEASE
- **MUST** use Java 17 for compilation and runtime
- **MUST** retain all Maven plugin configurations
- **MUST** use Spring Boot 2.9.0.RELEASE core dependencies
- **FORBIDDEN** to modify or remove core scaffold dependencies

### Frontend Scaffold (@req/front-project-public)
- **MUST** use Vue 2.6.14 as base framework
- **MUST** use Element UI 2.13.0 as component library
- **MUST** inherit all package.json dependencies
- **MUST** retain Vue CLI service configuration
- **FORBIDDEN** to replace or bypass scaffold core components

## Enforcement Mechanisms

### Violation Detection
- AI MUST flag `[SCAFFOLD_VIOLATION]` when detecting non-scaffold code
- Violations MUST be rejected during Plan phase
- Architecture committee approval required for exceptions

### Compliance Checking
- `/plan` and `/analyze` commands MUST validate scaffold compliance
- All generated code MUST be based on specified scaffolds
- Build configurations MUST inherit from scaffold settings

### Startup Validation
- Project initialization MUST be based on specified scaffolds
- Configuration files MUST reference scaffold dependencies
- Core scaffold files MUST NOT be modified

## Exception Process
Exceptions to scaffold requirements MUST follow:
1. Explicit user declaration of business necessity
2. Architecture committee review and approval
3. Documentation of deviation rationale
4. Alternative compliance verification

## Audit Requirements
Regular compliance audits MUST verify:
- [ ] Correct scaffold inheritance in configuration files
- [ ] No unauthorized scaffold modifications
- [ ] Proper dependency version alignment
- [ ] Build process follows scaffold specifications