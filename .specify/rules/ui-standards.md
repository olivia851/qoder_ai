# UI Design Standards Rule
**Rule Version**: 1.0
**Parent Constitution**: v1.1.0
**Enforcement Level**: MANDATORY

## Scope
This rule enforces UI design standards and CSS variable usage as mandated by the project constitution.

## Enforcement Requirements

### CSS Variable Compliance
- ALL color values must use CSS variables from `src/styles/theme.css`
- ALL spacing values must use predefined spacing variables
- NO hardcoded hex/rgb/px values allowed
- Font sizes must use typography tokens

### Component Implementation Standards
- Async buttons MUST include `:loading="loading"` binding
- Tables MUST have `stripe` and `border` properties
- Table headers MUST use `var(--color-gray-3)` background
- Row height MUST be `40px`
- Empty states MUST use `<el-empty description="暂无数据" />`

### Text Handling
- Single line overflow MUST use `.text-ellipsis` class
- Multi-line overflow MUST use `.text-ellipsis-3` class
- Numeric values MUST be right-aligned
- Numbers MUST use `font-variant-numeric: tabular-nums`

### Spacing System
- Base unit: `4px`
- Required variables: `--spacing-xs`, `--spacing-sm`, `--spacing-md`, `--spacing-lg`
- All layout spacing MUST use these variables

## Violation Handling
- AI MUST flag `[UI_VIOLATION]` when detecting non-compliant code
- Violations MUST be corrected before code acceptance
- `/analyze` command MUST include UI compliance checking

## Audit Checklist
- [ ] CSS variables properly imported from `src/styles/theme.css`
- [ ] No hardcoded color/spacing values
- [ ] Async buttons have loading states
- [ ] Text overflow properly handled
- [ ] Component properties meet standards