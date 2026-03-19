#!/bin/bash
# 文档生成和验证脚本

set -e

echo "=== 项目文档生成和验证工具 ==="

# 检查必要文件是否存在
check_files() {
    echo "检查必要文件..."
    
    if [ ! -f ".specify/memory/constitution.md" ]; then
        echo "❌ 错误: 缺少宪法文件 .specify/memory/constitution.md"
        exit 1
    fi
    
    if [ ! -d "doc" ]; then
        echo "❌ 错误: 缺少文档目录 doc/"
        exit 1
    fi
    
    echo "✅ 所有必要文件存在"
}

# 验证宪法文件格式
validate_constitution() {
    echo "验证宪法文件格式..."
    
    # 检查是否包含所有必需章节
    required_sections=("安全与合规底线" "质量内建与可测试性" "架构一致性与技术治理" "代码与协作规范" "系统可观测性" "用户体验与交互卓越" "治理与修订")
    
    for section in "${required_sections[@]}"; do
        if ! grep -q "#.*$section" ".specify/memory/constitution.md"; then
            echo "❌ 错误: 宪法文件缺少章节 '$section'"
            exit 1
        fi
    done
    
    # 检查版本信息
    if ! grep -q "\*\*版本\*\*: v" ".specify/memory/constitution.md"; then
        echo "❌ 错误: 宪法文件缺少版本信息"
        exit 1
    fi
    
    echo "✅ 宪法文件格式验证通过"
}

# 生成文档索引
generate_doc_index() {
    echo "生成文档索引..."
    
    cat > doc/index.md << EOF
# 项目文档索引

## 核心文档

- [项目宪法](../.specify/memory/constitution.md) - 项目最高治理原则
- [文档目录说明](README.md) - 文档组织结构说明

## 技术文档

### 架构设计
*(待补充)*

### 开发指南
*(待补充)*

### 部署运维
*(待补充)*

### 测试文档
*(待补充)*

### 安全文档
*(待补充)*

### 治理流程
*(待补充)*

---
*本文档由自动化工具生成，最后更新时间: $(date '+%Y-%m-%d %H:%M:%S')*
EOF

    echo "✅ 文档索引生成完成"
}

# 运行所有检查
main() {
    check_files
    validate_constitution
    generate_doc_index
    
    echo ""
    echo "=== 所有检查和生成任务完成 ==="
    echo "✅ 项目宪法已正确配置"
    echo "✅ 文档目录结构已建立"
    echo "✅ 文档索引已生成"
    echo ""
    echo "下一步建议:"
    echo "1. 根据项目实际需求完善各分类下的具体文档"
    echo "2. 配置自动化文档生成工具"
    echo "3. 建立文档更新和维护流程"
}

# 执行主函数
main "$@"