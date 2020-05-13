---
title: Notes from "Domain Modeling Made Functional"
withtoc: true
---

The [book](https://fsharpforfunandprofit.com/books/).

Following along while typing the code into a F# Jupyter Notebook in [notebooks.azure.com](https://notebooks.azure.com/) is very helpful.

## Part 1: Understanding the Domain

### Chapter 1: Introducing Domain-Driven Design

> As a developer, you may think that your job is to write code. I disagree.
> A developer’s job is to solve a problem through software, and coding is just one aspect of software development.
> Good design and communication are just as important, if not more so.

- Focus on business events and workflows (`Domain Events`) rather than data structures
- Partition the problem domain into smaller subdomains
- Create a model of each subdomain in the solution
- Develop a common language (known as the `Ubiquitous Language`) that is shared between everyone involved in the project and is used everywhere in the code

**Event storming**

1. people write down business events on sticky notes and post them on the wall
2. Other people may respond by posting notes summarizing the business workflows that are triggered by these events
3. These workflows, in turn, often lead to other business events being created
4. The notes can be organized into a timeline, which may well trigger further discussion in the group

**Documenting commands**

We ask: "What made these `Domain Events` happen?". These things are called `Commands`.

Examples:

- if the command was "Make X happen", then, if the workflow made *X* happen, the corresponding `Domain Event` would be "X happened"
- command: "Place an order"; Domain Event: "Order placed"

Diagram:

```
                                                                                +------------------------------+
                                                                                |                              |
                                                                                |   Event                      |
                                                                                |                              |
                                                                           +---->   +--------------------------+-----+
                                                                           |    |   |                                |
+---------+             +-------------+     +----------------------+       |    +---+   Event                        |
|         |             |             |     |                      |       |        |                                |
|  Event  +------------->  Command    +----->  Business Workflow   +---------------->    +---------------------------+----+
|         |             |             |     |                      |       |        |    |                                |
+---------+             +-------------+     +----------------------+       |        +----+   Event                        |
                                                                           |             |                                |
                                                                           +------------>+                                |
                                                                                         |                                |
                                                                                         +--------------------------------+
```

We can partition a large domain into sub-domains, for example "order-taking domain", "shipping domain", and "billing domain".
