# UI Design & Implementation Standards (Supreme Rules)
**Version**: 2.0
**Governance**: This is a sub-rule of the Constitution.

> **AI 核心指令 (Critical Instructions for AI)**:
> 1. **物理路径锚定**：本项目所有 UI 变量均定义在 `src/styles/theme.css`。在实现 (Implement) 或修复代码时，必须确保变量名与该文件内容严格一致。
> 2. **禁止硬编码**：严禁在代码中使用任何 Hex (#...)、RGB 或 Px 硬编码数值。
> 3. **执法权**：在执行 `/analyze` 时，若发现直接使用数值而非变量的行为，必须标记为 **[UI_VIOLATION]** 并提供重构建议。

---

## 1. 资产引用与单位 (Assets & Units)

### 1.1 样式源文件锚定
- **核心定义文件**: `src/styles/theme.css`
- **引入要求**: 
  - AI 生成 Vue 组件时，若项目未配置全局样式引入，必须在 `<style scoped>` 中通过 `@import "@/styles/theme.css";` 显式引用。

### 1.2 字体基准 (Typography Baseline)
- **根字体 (Root Size)**: 基准为 `16px` (即 1rem = 16px)。
- **字体梯度映射**:
  - **H1 (一级标题)**: `var(--font-size-h1)` (对应 24px)
  - **H2 (二级标题)**: `var(--font-size-h2)` (对应 20px)
  - **H3 (小标题/加粗正文)**: `var(--font-size-lg)` (对应 16px)
  - **Body (标准正文)**: `var(--font-size-base)` (对应 14px)
  - **Small (辅助说明)**: `var(--font-size-sm)` (对应 12px)
- **行高规则**: 全局默认行高 `1.5`，特殊标注除外。

### 1.3 间距体系 (Spacing System)
- **基准**: `4px`。所有布局间距必须使用以下变量：
  - `var(--spacing-xs)` (4px) | `var(--spacing-sm)` (8px) | `var(--spacing-md)` (16px) | `var(--spacing-lg)` (24px)

---

## 2. 文本行为与对齐 (Typography Behavior)

### 2.1 文本溢出处理 (强制要求)
- **单行溢出**: 列表单元格、卡片标题、侧边栏文字必须使用省略号。
  - **实现类**: 使用 `.text-ellipsis` (需确保全局引用 theme.css 中的 class)。
- **多行溢出**: 备注、详情描述默认展示 **3 行**，超出部分省略。
  - **实现类**: 使用 `.text-ellipsis-3`。

### 2.2 视觉对齐规范
- **数字/金额**: 在 Table 或 List 中展示时，必须使用 `align="right"` (右对齐)。
- **表单 Label**: 统一使用右对齐，确保与输入框间距一致。

---

## 3. 组件映射与交互模式 (Component Patterns)

### 3.1 核心组件约束 (Vue 2 + Element UI)
- **Button**: 异步提交必须绑定 `:loading="loading"`。
- **Table**: 
  - 必须设置 `stripe` (斑马纹) 和 `border`。
  - 表头背景色固定使用 `var(--color-gray-3)`。
  - 行高固定使用 `40px`。
- **Empty**: 所有列表页在数据为空时，必须使用 `<el-empty description="暂无数据" />`。

### 3.2 交互反馈
- **校验提示**: 表单项 (Form Item) 校验失败时，错误文案必须在输入框下方即时显示，颜色使用 `var(--color-error)`。
- **操作结果**: 成功操作必须弹出 `this.$message.success`；失败必须捕获异常并弹出 `this.$message.error`。

---

## 4. 禁止事项清单 (Anti-Patterns)

1. **[禁数值]**: 禁止 `margin-top: 10px;` (非 4 倍数且无变量)。
2. **[禁色值]**: 禁止 `color: #333;`。
3. **[禁内联]**: 严禁 `style="padding: 16px;"`。
4. **[禁原生]**: 禁止使用原生 `alert()`、`confirm()`。
5. **[禁裸露]**: 禁止在 `div` 下直接写文字，必须使用 `p` 或 `span` 标签。

---

## 5. 自动巡检审计 (Audit Checklist)
AI 在执行 `/analyze` 时需自检：
- [ ] 代码中是否引用了 `src/styles/theme.css`？
- [ ] 是否所有颜色/间距都使用了 `var(--...)`？
- [ ] 异步按钮是否具备 Loading 态？
- [ ] 文本溢出逻辑是否已处理？