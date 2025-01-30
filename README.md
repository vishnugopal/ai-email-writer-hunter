# README

To get everything started, bin/setup.

## Goal

You’ll build a Rails application named “AI Email Writer” to assist users in drafting effective [cold emails](https://www.notion.so/Senior-Product-Engineer-Rails-Technical-assessment-17514ec4c85d80f5af47eb9c497507d5?pvs=21).

The home page will prompt users to input the following details:

- [x] The purpose of the email
- [x] Recipient information
- [x] Sender information
- [x] Any relevant parameters for the email (e.g., reading time, language, tone, etc.)

In response, the application should generate and return a tailored cold email draft that aligns with the provided criteria, including a subject line and body content.

The application will also maintain a history of previously generated emails, allowing users to view and reference past drafts directly within the interface.

## Guidance

- [x] Authentication, account creation, and session management **are not required**.
- [x] You can use any storage solution (e.g., in-memory, file-based, or database-backed).
- [x] We have intentionally left out specific technical or design guidelines. Follow the mantra: “Make it work, make it right, make it fast.”
- [x] We have provided an OpenAI API key via email, enabling interaction with any OpenAI model through their API. However, you can use alternative platforms or tools if they better suit your approach.

## Output

You are expected to share the code of a functional Rails application, which can run on any computer (e.g., `bin/rails db:migrate` and `bin/rails server` should suffice; we’re also fine with Docker compose or similar).

A zip file or a link to a GitHub repository both work.

In addition to the files, any textual or visual material can be embedded in your repository to help us assess your work. Do not hesitate to justify your choices, suggest tracks for improvements, explain the roadblocks you might have encountered, etc.

## Addendums

### What is a cold email?

A **cold email** is an unsolicited email sent to someone who has no prior relationship or contact with the sender. The goal of a cold email is typically to:

- **Initiate a connection** with a potential customer, client, or partner.
- **Present an opportunity** such as a service, product, collaboration, or job opening.
- **Generate leads** for sales or business growth.
- **Seek a specific outcome**, like scheduling a meeting, getting a reply, or sharing information.

**Characteristics of a Cold Email**

- **Personalization:** Even though it’s unsolicited, a good cold email often includes personalized elements to make it relevant to the recipient.
- **Clear Purpose:** It clearly states the reason for reaching out.
- **Conciseness:** It is brief and to the point to respect the recipient’s time.
- **Value Proposition:** It highlights why the recipient should care or benefit from engaging with the sender.
- **Call-to-Action (CTA):** It includes a specific request, such as scheduling a meeting, answering a question, or providing feedback.

### **What if I’ve never interacted with an LLM?**

Relax: this test doesn’t require an extended experience in prompt engineering.

Just follow the guide on the [**ruby-openai**](https://github.com/alexrudall/ruby-openai) gem (especially the [Chat](https://github.com/alexrudall/ruby-openai?tab=readme-ov-file#chat) section); we’re sure you’ll do great!

### Should I look at existing similar services?

If you’re seeking inspiration or wish to compare your solution to existing tools, you can definitely consider exploring [HelpDesk’s AI email generator](https://www.helpdesk.com/ai-email-generator/), [Twain](https://www.twain.ai/), or [AImReply](https://aimreply.com/). However, keep in mind that not only will we assess the final output, but also the process you followed to get there 😇
