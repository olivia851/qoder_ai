/**
 * Project Theme Style - UI Assets
 * 严格对应 .spec-kit/rules/ui-standards.md (v2.5)
 * 供 30 人开发团队及 AI Agent 统一调用
 */

:root {
  /* ==========================================================================
     1. 色彩令牌 (Color Tokens)
          ========================================================================== */
    // **这部分颜色更新了**
    --color-primary: #409eff;           /* 品牌主色 */
    --color-primary-hover: #4096ff;       /* 悬浮态 */
    --color-primary-bg: #f5f7fa;          /* 浅色背景/行高亮 */

  --color-success: #67c23a;             /* 成功状态 */
  --color-warning: #e6a23c;             /* 警告状态 */
  --color-error: #f56c6c;               /* 错误/危险状态 */

  /* 文本颜色 (基于 rgba 以适配不同背景) */
  --color-text-main: #303133;    /* 一级标题/重要文字 字体加粗 */
  --color-text-base: #303133;    /* 正文/二级标题 */
  --color-text-tip: #666;     /* 辅助说明/占位符/禁用 */

  /* 边框与背景 */
  --color-border-base: #e8eaec;         /* 默认边框 */
  --color-gray-3: #edf1f5;              /* 表头背景/标签底色 */
  --color-bg-page: #edf1f5;             /* 页面底色 */
  --color-white: #ffffff;

  /* ==========================================================================
     2. 字体令牌 (Typography Tokens)
     ========================================================================== */
  --font-size-root: 16px;               /* 根字体基准 */
  --font-size-h1: 24px;                 /* H1 一级标题 */
  --font-size-h2: 20px;                 /* H2 二级标题 */
  --font-size-lg: 16px;                 /* H3/加粗正文/1rem */
  --font-size-base: 14px;               /* 标准正文 */
  --font-size-sm: 12px;                 /* 辅助说明/小字号 (必须包含) */

  --font-weight-regular: 400;           /* 普通 */
  --font-weight-medium: 500;            /* 中等/小标题 */
  --font-weight-bold: 600;              /* 粗体 */

  --line-height-base: 1.5;              /* 全局默认行高 */

  /* ==========================================================================
     3. 间距令牌 (Spacing Tokens - 4px Base)
     ========================================================================== */
  --spacing-xs: 4px;                    /* 极小间距 */
  --spacing-sm: 8px;                    /* 小间距 */
  --spacing-md: 16px;                   /* 标准间距/组件间 */
  --spacing-lg: 24px;                   /* 大间距/容器内边距 */
  --spacing-xl: 32px;                   /* 特大间距 */

  /* ==========================================================================
     4. 组件特定参数 (Component Specifics)
     ========================================================================== */
  --table-header-bg: var(--color-gray-3);
  --table-row-height: 40px;
  --card-border-radius: 8px;
}

/* ==========================================================================
   5. 通用辅助类 (Utility Classes - 供 AI 执法引用)
      ========================================================================== */

/* 单行文本溢出省略 */
.text-ellipsis {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  display: block;
}

/* 多行文本溢出省略 (默认3行) */
.text-ellipsis-3 {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* 标准页面主容器布局 */
.page-container {
  padding: var(--spacing-lg);
  background-color: var(--color-bg-page);
  min-height: 100vh;
}

/* 标准区块/卡片容器 */
.card-container {
  background-color: var(--color-white);
  border-radius: var(--card-border-radius);
  padding: var(--spacing-lg);
  margin-bottom: var(--spacing-md);
  border: 1px solid var(--color-border-base);
}

/* 数字/金额对齐类 */
.text-number {
  text-align: **center**;
  font-variant-numeric: tabular-nums; /* 等宽数字，防止抖动 */
}