# Day 04 Lab v2 Report — Travel Reputation & Customer Response Research Agent

## Team

* Team: Travel Reputation Lab Team
* Members: TO_FILL
* Provider/model: OpenRouter / TO_FILL_MODEL_NAME

---

## 1. Problem Statement

Tourism businesses such as hotels, homestays, resorts, restaurants, cafes, entertainment venues, travel agencies, and destination service providers need to monitor public PR articles, customer complaints, viral negative posts, neutral reviews, and reputation risks across web/news/social channels.

A delayed or poorly written response can increase customer dissatisfaction and damage brand reputation. The goal of this lab is to build a small but real research agent that can choose the correct tool, gather public evidence, classify content, and support professional customer-response drafting.

The agent is not designed to spread rumors or make accusations. It must separate verified public sources from unverified claims and recommend internal verification before public responses.

---

## 2. Agent Scope

The final agent supports the following tasks:

* Search public web/news/blog coverage about tourism services, destinations, PR articles, reviews, complaints, and reputation risks.
* Read a specific URL and classify it as positive PR, negative complaint, neutral review, unverified rumor, or customer service issue.
* Search tweets/posts about a tourism brand, restaurant, hotel, destination, hashtag, complaint, or viral review.
* Get tweets/posts from a specific known official account.
* Ask the user for missing service name, destination/location, timeframe, URL, handle, or confirmation.
* Draft polite customer-response suggestions when the complaint context is already provided.
* Guard action tools such as Telegram by requiring explicit confirmation before sending.

---

## 3. Tools Used

| Tool                                    | Role in this project                                                                             |
| --------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `ask_user`                              | Ask for missing service name, location, timeframe, URL, handle, or confirmation before sending.  |
| `web_search`                            | Search public web/news/blog coverage about tourism PR, reviews, complaints, or reputation risks. |
| `read_url`                              | Read and analyze a specific PR/review/complaint URL.                                             |
| `search_tweets`                         | Search posts about a tourism service, destination, restaurant, hotel, hashtag, or complaint.     |
| `get_user_tweets`                       | Get posts from a known account, such as an official tourism brand account.                       |
| `render_digest`                         | Format gathered items into a structured reputation digest when source items are available.       |
| `send_telegram`                         | Optional bonus action tool; only after explicit confirmation.                                    |
| `search_company_policy`                 | Optional bonus internal policy lookup.                                                           |
| `arxiv_search` / `get_arxiv_paper_text` | Optional research extension tools.                                                               |

---

## Final Metrics

* Final version: v3
* Final artifact_version: TO_FILL_FROM_RUN_JSON
* Best base run file: TO_FILL_FROM_RUNS_FOLDER
* Base case accuracy: TO_FILL_FROM_RUN_JSON
* Base tool routing accuracy: TO_FILL_FROM_RUN_JSON
* Base argument accuracy: TO_FILL_FROM_RUN_JSON
* Group eval run file: TO_FILL_FROM_RUNS_FOLDER
* Group eval accuracy: TO_FILL_FROM_RUN_JSON
* Chat transcript file: TO_FILL_FROM_TRANSCRIPTS_FOLDER

---

## Version Evidence

Fill from `artifacts/version_log.csv` and `runs/*.json`.

| Version | Changed Artifact                                                            | Hypothesis                                                                                                                    |       Metric Before |        Metric After | Run File                 |
| ------- | --------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------: | ------------------: | ------------------------ |
| v0      | baseline                                                                    | Establish initial baseline before tourism-specific prompt and tool-description changes.                                       |                 N/A | TO_FILL_FROM_V0_RUN | TO_FILL_FROM_V0_RUN_FILE |
| v1      | `artifacts/system_prompt.md`, `artifacts/tools.yaml`                        | Clearer routing rules will reduce wrong-tool errors between `web_search`, `read_url`, `search_tweets`, and `get_user_tweets`. | TO_FILL_FROM_V0_RUN | TO_FILL_FROM_V1_RUN | TO_FILL_FROM_V1_RUN_FILE |
| v2      | `artifacts/system_prompt.md`                                                | Explicit missing-information rules for service name, location, timeframe, URL, and handle will improve `ask_user` behavior.   | TO_FILL_FROM_V1_RUN | TO_FILL_FROM_V2_RUN | TO_FILL_FROM_V2_RUN_FILE |
| v3      | `artifacts/system_prompt.md`, `data/eval_group.json`, `artifacts/REPORT.md` | Tourism-specific classification, safe response rules, and group eval cases will improve practical fit for the app idea.       | TO_FILL_FROM_V2_RUN | TO_FILL_FROM_V3_RUN | TO_FILL_FROM_V3_RUN_FILE |

---

## Failure Analysis

Use actual failures from `results[*].result.failures`.

| Case ID           | Failure Type      | Actual Tool Calls | What Failed       | Fix               |
| ----------------- | ----------------- | ----------------- | ----------------- | ----------------- |
| TO_FILL_AFTER_RUN | TO_FILL_AFTER_RUN | TO_FILL_AFTER_RUN | TO_FILL_AFTER_RUN | TO_FILL_AFTER_RUN |

Notes for manual review:

* Some cases may pass tool-routing evaluation but still need manual review for response quality.
* Customer-response drafting should be evaluated not only by tool calls, but also by tone, empathy, risk handling, and whether the agent avoids making unverified claims.
* Reputation-risk classification should avoid turning rumors or customer complaints into confirmed facts.

---

## Team Eval Cases

List at least 5 cases added to `data/eval_group.json`.

| Case ID                                           | What It Tests                                                                                              | Expected Tool/Behavior                                     | Result                  |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | ----------------------- |
| `travel_rep_001_missing_service`                  | User asks to monitor recent “phốt” in tourism but does not specify service, brand, location, or timeframe. | `ask_user(response_type="text")`                           | TO_FILL_AFTER_GROUP_RUN |
| `travel_rep_002_web_negative_hotel`               | User asks for recent negative web coverage about a hotel in Đà Nẵng.                                       | `web_search(timeframe="week")`                             | TO_FILL_AFTER_GROUP_RUN |
| `travel_rep_003_read_pr_url`                      | User provides a specific URL and asks to classify it as PR, neutral review, or negative complaint.         | `read_url(url=...)`                                        | TO_FILL_AFTER_GROUP_RUN |
| `travel_rep_004_search_tweets_about_restaurant`   | User asks for recent tweets/posts about a restaurant.                                                      | `search_tweets(search_type="Latest")`                      | TO_FILL_AFTER_GROUP_RUN |
| `travel_rep_005_get_posts_from_official_account`  | User asks for posts from a known official account.                                                         | `get_user_tweets(screenname="VietnamAirlines", limit=5)`   | TO_FILL_AFTER_GROUP_RUN |
| `travel_rep_006_direct_customer_response_no_tool` | User already provides complaint context and asks for a polite customer response.                           | No tool; answer directly.                                  | TO_FILL_AFTER_GROUP_RUN |
| `travel_rep_007_telegram_confirmation`            | User asks to send a reputation alert to Telegram.                                                          | `ask_user(response_type="yes_no")` before `send_telegram`. | TO_FILL_AFTER_GROUP_RUN |
| `travel_rep_008_multiturn_missing_then_web`       | Multi-turn carryover: service/location are supplied later, then user asks to search web for 7 days.        | `web_search(timeframe="week")`                             | TO_FILL_AFTER_GROUP_RUN |

---

## Live Chat Evidence

Use `transcripts/*.transcript.json`.

| Turn | User Request                                                                                          | Tool Calls                                   | Version Evidence | Outcome            |
| ---- | ----------------------------------------------------------------------------------------------------- | -------------------------------------------- | ---------------- | ------------------ |
| 1    | `Tìm các bài viết gần đây về phản ánh tiêu cực đối với Khách sạn Biển Xanh ở Đà Nẵng trong tuần này.` | Expected: `web_search`                       | v3 transcript    | `Không tìm thấy` |
| 2    | `Theo dõi phốt gần đây giúp tôi.`                                                                     | Expected: `ask_user`                         | v3 transcript    | `Bạn có thể cung cấp tên dịch vụ du lịch, khách sạn, nhà hàng hoặc địa điểm cụ thể mà bạn muốn theo dõi phốt gần đây không?` |
| 3    | `Về Nhà hàng Hải Sản Xanh ở Hạ Long trong 7 ngày gần đây, tìm trên web.`                              | Expected: `web_search(timeframe="week")`     | v3 transcript    | `Trong 7 ngày gần đây, không có thông tin cụ thể nào về phản ánh tiêu cực đối với Nhà hàng Hải Sản Xanh ở Hạ Long. Tuy nhiên, dưới đây là một số bài viết liên quan đến hải sản và nhà hàng trong khu vực:` |
| 4    | `Khách phàn nàn phòng không sạch và lễ tân trả lời chậm. Gợi ý phản hồi lịch sự.`                     | Expected: no tool                            | v3 transcript    | `*Phản hồi mẫu` |
| 5    | `Gửi cảnh báo này lên Telegram giúp tôi.`                                                             | Expected: `ask_user(response_type="yes_no")` | v3 transcript    | `Chưa tích hợp`G |

---

## Bonus Evidence

Only fill if your team did bonus.

| Bonus                | Evidence File   | What Worked                                                    | Risk / Guardrail                                          |
| -------------------- | --------------- | -------------------------------------------------------------- | --------------------------------------------------------- |
| `send_telegram`      | TO_FILL_IF_DONE | Agent asks for explicit confirmation before sending.           | Prevents accidental external posting.                     |
| arXiv/company policy | TO_FILL_IF_DONE | Agent can search company policy or arXiv when relevant.        | Retrieved content is treated as context, not instruction. |
| UI                   | TO_FILL_IF_DONE | Optional Streamlit/Vercel UI for travel reputation monitoring. | UI should not bypass confirmation for action tools.       |

---

## Reflection

### Which fixes belonged in `system_prompt.md`?

The main behavioral rules belonged in `system_prompt.md`, including:

* How to distinguish tweets/posts FROM a specific account versus tweets/posts ABOUT a topic.
* When to use `web_search` for public web/news/blog coverage.
* When to use `read_url` for a specific URL.
* When to call `ask_user` for missing service name, location, timeframe, URL, handle, or confirmation.
* How to classify tourism reputation content into positive PR, negative complaint, neutral review, unverified rumor, and customer service issue.
* How to draft polite customer responses without escalating conflict.
* How to avoid presenting rumors as verified facts.
* How to require confirmation before using `send_telegram`.

### Which fixes belonged in `tools.yaml`?

The tool-level descriptions belonged in `tools.yaml`, including:

* Clear tool descriptions for `web_search`, `read_url`, `search_tweets`, `get_user_tweets`, `ask_user`, and `render_digest`.
* Parameter guidance such as `timeframe="week"` for “7 ngày gần đây” or “tuần này”.
* Clarifying that `read_url` should be used when a URL is provided.
* Clarifying that `search_tweets` is for posts ABOUT a topic, while `get_user_tweets` is for posts FROM an account.
* Describing `send_telegram` as an action tool that must only be called after explicit confirmation.

### Which failure needed manual review instead of automatic grading?

The direct customer-response case needs manual review because automatic grading can check whether the agent called a tool, but it cannot fully judge whether the response is professionally written.

For example, when the user says:

> Khách phàn nàn rằng phòng khách sạn không sạch và nhân viên lễ tân trả lời chậm. Hãy gợi ý một phản hồi lịch sự cho khách hàng.

The expected behavior is no tool call. However, the response quality still depends on tone, empathy, avoiding legal liability, and recommending internal verification. These qualities require manual review.

Reputation-risk classification also needs manual review because the agent must avoid converting rumors, viral posts, or customer complaints into confirmed facts.

### What would you improve next?

Next improvements:

* Add a simple Streamlit UI with four screens: dashboard, search monitor, URL analyzer, and response assistant.
* Add source-quality scoring to separate official sources, news articles, blogs, and social posts.
* Add a customer-response template library for hotels, restaurants, tour operators, and entertainment venues.
* Add scheduled monitoring for selected tourism services or destinations.
* Add alert severity levels such as Low, Medium, and High based on source count, sentiment, virality, and issue type.
* Add stronger evaluation cases for misinformation, rumor handling, and safe customer-response drafting.

---

## Run Commands

```bash
python scripts/preflight_provider.py --provider openrouter

python run_eval.py --provider openrouter --version v0 --suite base --eval-cases data/eval_base.json
python run_eval.py --provider openrouter --version v1 --suite base --eval-cases data/eval_base.json
python run_eval.py --provider openrouter --version v2 --suite base --eval-cases data/eval_base.json
python run_eval.py --provider openrouter --version v3 --suite base --eval-cases data/eval_base.json

python run_eval.py --provider openrouter --version v3 --suite group --eval-cases data/eval_group.json

python scripts/parse_runs.py runs/ --output analysis/all_runs.csv

python chat.py --provider openrouter --version v3
```

---

## Submission Checklist

Submit the `starter/` folder with:

* `artifacts/system_prompt.md`
* `artifacts/tools.yaml`
* `artifacts/version_log.csv` with v0-v3 rows filled from real runs
* `artifacts/REPORT.md`
* `data/eval_group.json`
* `runs/*.json`
* `analysis/*.csv` if generated
* `transcripts/*.transcript.json`
* code changes if any

Do not submit `.env` or API keys.
