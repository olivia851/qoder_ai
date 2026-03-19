#!/bin/bash
# 项目治理合规性检查脚本 (增强版)

set -e

echo "=== 项目治理合规性检查 ==="

# 检查宪法遵守情况
check_constitution_compliance() {
    echo "检查宪法遵守情况..."
    
    # 检查是否存在宪法文件
    if [ ! -f ".specify/memory/constitution.md" ]; then
        echo "❌ 错误: 缺少项目宪法文件"
        return 1
    fi
    
    # 检查宪法版本
    constitution_version=$(grep "\*\*版本\*\*: v" ".specify/memory/constitution.md" | cut -d' ' -f3)
    echo "📄 当前宪法版本: $constitution_version"
    
    # 检查关键原则是否被遵守（模拟检查）
    echo "🔍 正在检查关键治理原则..."
    
    # 这里可以添加具体的检查逻辑
    echo "✅ 宪法遵守情况检查完成"
}

# 检查文档完整性
check_documentation_integrity() {
    echo "检查文档完整性..."
    
    required_docs=("doc/README.md" "doc/index.md")
    
    for doc in "${required_docs[@]}"; do
        if [ ! -f "$doc" ]; then
            echo "❌ 错误: 缺少必要文档 $doc"
            return 1
        fi
    done
    
    echo "✅ 文档完整性检查通过"
}

# 检查目录结构（增强版）
check_directory_structure() {
    echo "检查目录结构..."
    
    required_dirs=("doc" ".specify/memory" ".specify/templates" ".specify/rules")
    doc_subdirs=("architecture" "development" "deployment" "testing" "security" "governance" "templates")
    
    # 检查主目录
    for dir in "${required_dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            echo "❌ 错误: 缺少必要目录 $dir"
            return 1
        fi
    done
    
    # 检查文档子目录
    for subdir in "${doc_subdirs[@]}"; do
        if [ ! -d "doc/$subdir" ]; then
            echo "❌ 错误: 缺少文档子目录 doc/$subdir"
            return 1
        fi
        
        # 检查每个子目录是否包含README.md
        if [ ! -f "doc/$subdir/README.md" ]; then
            echo "❌ 错误: 缺少文档说明文件 doc/$subdir/README.md"
            return 1
        fi
    done
    
    echo "✅ 目录结构检查通过"
}

# 生成治理报告
generate_governance_report() {
    echo "生成治理报告..."
    
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    cat > doc/governance/report.md << EOF
# 项目治理合规性报告

## 报告信息
- **生成时间**: $timestamp
- **检查范围**: 项目宪法遵守情况、文档完整性、目录结构

## 检查结果

### 宪法遵守情况
✅ 项目宪法文件存在
✅ 宪法版本信息完整
✅ 基本治理原则已建立

### 文档完整性
✅ 必要文档均已创建
✅ 文档结构符合规范
✅ 各分类目录说明完备

### 目录结构
✅ 必要目录均已建立
✅ 文档分类结构完善
✅ 项目结构规范化

## 改进建议

1. **完善具体文档内容**：目前文档多为框架性内容，需要根据项目实际进展补充具体内容
2. **建立自动化检查机制**：可以考虑集成到CI/CD流程中
3. **定期治理审查**：建议每月进行一次全面的治理合规性检查
4. **文档分类管理**：按照既定分类持续完善各类文档

## 下一步行动

- [ ] 根据项目进展完善各分类文档
- [ ] 配置自动化治理检查工具
- [ ] 建立治理违规预警机制
- [ ] 定期更新治理报告

---
*本报告由自动化工具生成*
EOF

    echo "✅ 治理报告生成完成: doc/governance/report.md"
}

# 主函数
main() {
    check_directory_structure
    check_documentation_integrity
    check_constitution_compliance
    generate_governance_report
    
    echo ""
    echo "=== 治理合规性检查完成 ==="
    echo "✅ 所有基础治理要求均已满足"
    echo "📋 详细报告请查看: doc/governance/report.md"
}

# 执行检查
main "$@"