#!/bin/bash
# 用法: ./new-post.sh "文章标题"
# 会在 _posts/ 下创建一个带模板的 Markdown 文件

set -e

if [ -z "$1" ]; then
  echo "用法: ./new-post.sh \"文章标题\""
  exit 1
fi

TITLE="$1"
DATE=$(date +%Y-%m-%d)
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9\-]//g')
FILE="_posts/${DATE}-${SLUG}.md"

if [ -f "$FILE" ]; then
  echo "文件已存在: $FILE"
  exit 1
fi

cat > "$FILE" << EOF
---
title: "${TITLE}"
date: "${DATE}"
summary: "在这里写一句话摘要"
tags: []
---

在这里写正文内容...
EOF

echo "✅ 已创建: $FILE"
echo "编辑完成后运行: npm run build && git add . && git commit -m \"post: ${TITLE}\" && git push"
