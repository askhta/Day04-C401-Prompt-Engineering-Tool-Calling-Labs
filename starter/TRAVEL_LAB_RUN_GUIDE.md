# Travel Reputation & Customer Response Agent — Run Guide

## Đề tài

**Travel Reputation & Customer Response Agent** là app/agent hỗ trợ doanh nghiệp du lịch theo dõi bài PR, phản ánh tiêu cực, review trung lập, bài đăng mạng xã hội và gợi ý phản hồi khách hàng cho các dịch vụ như nơi lưu trú, ăn uống, vui chơi giải trí, tour và lữ hành.

## Các file đã chỉnh

- `artifacts/system_prompt.md`: đã cập nhật prompt theo bài toán du lịch, routing tool, missing-info, response guardrails.
- `artifacts/tools.yaml`: đã cập nhật mô tả tool theo ngữ cảnh tourism reputation.
- `data/eval_group.json`: đã thêm 8 eval case nhóm.
- `artifacts/REPORT.md`: đã viết khung report đầy đủ cho đề tài.
- `artifacts/version_log.csv`: đã thêm các dòng v0-v3, cần điền hash/metric/run_file sau khi chạy thật.

## Setup

```bash
cd starter
python -m venv .venv