#!/bin/bash
# 一键构建 + 推送
set -e
cd "$(dirname "$0")"
echo "🔨 构建中..."
npm run build
echo "📦 提交中..."
git add .
git commit -m "post: $(date +%Y-%m-%d) 更新"
echo "🚀 推送中..."
git push
echo "✅ 完成！稍等 1-2 分钟即可在线上看到更新。"
