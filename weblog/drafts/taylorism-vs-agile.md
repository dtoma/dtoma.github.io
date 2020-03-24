---
title: Personal experience with various management styles
---

# Personal experience with various management styles

I have so far worked for 3 different companies for at least 1 year. Each manager I've worked under had a different style, some I liked better than others.

---

## 1. Definitions

### Scientific Management (Taylorism?)

[Wikipedia](https://en.wikipedia.org/wiki/Scientific_management)

> Scientific management is a theory of management that analyzes and synthesizes workflows. Its main objective is improving economic efficiency, especially labor productivity. It was one of the earliest attempts to apply science to the engineering of processes and to management. Scientific management is sometimes known as Taylorism after its founder, Frederick Winslow Taylor.

Simply put, the idea is to turn a worker into a cog part of an optimized process. The worker doesn't need to think, they just need to execute perfectly what management has thought for them. This is very useful when working on a repeatable industrial process, but terribly inefficient when responding to regular changes and new problems.

### Agile

[Manifesto for Agile Software Development ](https://agilemanifesto.org/)

- Individuals and interactions over processes and tools
- Working software over comprehensive documentation
- Customer collaboration over contract negotiation
- Responding to change over following a plan

Full of good intentions, the problem with Agile is its vague definition. Everyone has a personal interpretation of what Agile means. In reality, few companies that say they are Agile, really are.

### Scrum

[Scrum.org](https://www.scrum.org/resources/what-is-scrum)

#### The Scrum Events

Prescribed events are used in Scrum to create regularity and to minimize the need for meetings not defined in Scrum. All events are time-boxed. Once a Sprint begins, its duration is fixed and cannot be shortened or lengthened. The remaining events may end whenever the purpose of the event is achieved, ensuring an appropriate amount of time is spent without allowing waste in the process.  The Scrum Events are:

- Sprint
- Sprint Planning
- Daily Scrum
- Sprint Review
- Sprint Retrospective

#### Scrum Artifacts

Scrum’s artifacts represent work or value to provide transparency and opportunities for inspection and adaptation. Artifacts defined by Scrum are specifically designed to maximize transparency of key information so that everybody has the same understanding of the artifact. The Scrum Artifacts are:

- Product Backlog
- Sprint Backlog
- Increment

See also [the Scrum Guide](https://www.scrumguides.org/scrum-guide.html.), concepts of Product Owners, Scrum Masters, etc.

All in all, Scrum to me is a template of how to start turning a team into something vaguely agile, while still being close enough in structure to what big organizations expect. It's a way to convince managers to let the team start taking ownership of how they are managed.

It is paradoxical to follow an "Agile process" when the Agile Manifesto specifically mentions "Individuals and interactions over processes and tools". This is why I believe Scrum should be seen as a stepping stone, not an end goal.

---

## 2. When Scrum is used to hide Taylorism

It is easy to abuse Scrum and turn it into a tool for enforcing micro management and strict processes.

### Story points

One of the main issues with Scrum is that the concept of a story point is poorly explained (or poorly defined). Everyone has a different understanding of what "complexity" means, hence why many end up using story points as a unit of work, for example "1 story point = 1 day of work". This makes planning very easy: 5 work days per week, `n` weeks per sprint, total story points per person should be `5 * n`.

This ignores many realities:
1. One of the main points of Agile is that we can't know for sure how long something will take, so instead of giving estimates that will rarely hold, we work incrementally and transparently
2. Technical debt can add variance to the time it takes to implement or modify a given piece of code
3. Testing, refactoring, code review, etc. are not always taken into account when pricing a story in terms of "amount of work"
4. Productivity is not constant because employees are human

A better way to price stories is to agree on a baseline. For example:
1. a task the team has to do every now and then can be given a reference value of 3 story points, knowing that it would usually take anywhere from 2 to 5 days to deliver
2. easier stories can be priced at 1 or 2 points
3. more difficult tasks at 5 points
4. anything above 5 points should be split into smaller stories, because it becomes too difficult to estimate its complexity and time to delivery

It is also possible to simplify the pricing increments from story points to sized like Small/Medium/Large.

### Velocity

In short, velocity should be a measure, not an objective:
1. Over the past `n` sprints, we have an average velocity of 30
2. Let's not plan 40 story points for the next sprint, we're unlikely to hit that goal

However, this is where the Taylorist mindset takes hold, and we see people using velocity as a target of how much an employee should be delivering per sprint.

[collab.net](https://resources.collab.net/agile-101/agile-scrum-velocity)

*In an attempt to maximize velocity, a team may in fact achieve the opposite. If asked to maximize velocity, a team may skimp on unit or acceptance testing, reduce customer collaboration, skip fixing bugs, minimize refactoring, or many other key benefits of the various agile development practices. While potentially offering short-term improvement (if you can call it that), there will be a negative long-term impact. The goal is not maximized velocity, but rather optimal velocity over time, which takes into account many factors including the quality of the end product.*

[visual-paradigm.com](https://www.visual-paradigm.com/scrum/what-is-scrum-velocity/)

*In Scrum, velocity help you to understand how long it will take your team to complete the product backlog. However, it typically takes few sprints for the team figure out a more stable velocity. To estimate more accurate velocity for your team, we can gain the experience based on the past track-record of the team. It will be more accurately forecasting of how many stories a Team can do in a Sprint. For forecasting purposes the average of the last three or four Sprint’s Velocity should be used.*

[Scrum.org blog](https://www.scrum.org/resources/blog/agile-metrics-velocity)

*The Ugly: When Leadership decides to use improvement in Velocity as a measure to gauge Development Teams’ performance and teams become aware about it, things become ugly. Now Development Teams will start fudging the sizes of their PBI’s / tasks to ‘bloat’ their velocity, just to ensure they appear to meet (may be even beat) their target velocity. At this point transparency will cease to exist in the team ensuring mechanical Scrum implementation resulting in sub-optimal metrics and delivery.*

[Scrum.org blog](https://www.scrum.org/resources/blog/moving-beyond-velocity)

*I once worked at a company where a yearly performance objective was set by a management team:*

*Every developer will increase their individual contributions towards the team's velocity by x%, measured on a quarterly basis.*

*Even though the managers had good intentions, as you can imagine, there wasn't much collaboration going on within those Scrum Teams, as there was no incentive to help out a teammate. I'm also sure story point inflation was rampant, with developers inflating their estimates to provide a safety gap. It's just human nature, which is actually backed by a theory called Goodhart's Law, which states:*

*"When a measure becomes a target, it ceases to be a good measure."*

[Agile alliance](https://www.agilealliance.org/glossary/velocity/#q=~(infinite~false~filters~(postType~(~'page~'post~'aa_book~'aa_event_session~'aa_experience_report~'aa_glossary~'aa_research_paper~'aa_video)~tags~(~'velocity))~searchTerm~'~sort~false~sortDirection~'asc~page~1))

*only the aggregate velocity of the team matters, and the phrase “individual velocity” is meaningless; a team is a mechanism intended to yield more than the sum of its individual parts*

[Sealights.io](https://www.sealights.io/sprint-velocity/scrum-velocity-5-things-that-can-go-wrong/)

- Antipattern #1: Setting Targets for Velocity
- Antipattern #2: Expecting Instantaneous Maximum Velocity
- Antipattern #3: Work Not Broken Down into Granular Pieces
- Antipattern #4: No Slack
- Antipattern #5: Testing, Technical Debt and Known Bugs

In conclusion, good team velocity is a consequence of doing thing well, not an objective by itself.

---

## 3. Making scrum kind of work

It's possible to have management come one day saying the team should "do Scrum", and actually pull it off.

Key points:

- Estimates aren't exact
- Velocity isn't constant
- Product owner is critical
- Different folks, different strokes
- Virtuous feedback loop
- It's also technical

### Estimates aren't exact

When estimating, we are not trying to predict the exact time it would take for a given person to finish a task.
It's about having an idea of how long it would take the team, on average, to complete this task.

It's important to have a baseline.

For example in a previous team we had a recurring kind of task: any one of our providers would update their APIs.
We'd usually have to:

- update a few fields in a number of structures
- update the corresponding tests

This started off as a 5 points task, and we planned we'd be able to do 2 per sprint (3 weeks).

Anything more complex, eg. adding a new feature, supporting a new provider, etc. would be priced higher, or split.

Anything simpler, eg. updating a log message, fix an easy bug, etc. would be priced lower.

### Velocity isn't constant

What's interesting is not the velocity at the end of a sprint, it's the trend we can observe over time.
A team can gain or lose members, unexpected issues can disturb a sprint or two.

The team can also decide to price stories differently over time as they get more comfortable with their perimeter.

It can be a red flag if the `velocity/nb team members` decreases over time, it's probably a good thing if it increases, but it's not in itself a useful metric:
it has to be used in conjunction with the context of the team.

In the team mentioned above, after a few months we changed our baseline from 5 points to 3, as we were able to deliver faster thanks to:

1. deeper knowledge of our (legacy) code base
2. improved automated testing
3. more consistent coding standards thanks to code review

### Product owner is critical

The most productive team I've been a part of had an amazing product owner. He was the head of the department we built a product for. Every meeting we had (sprint planning, backlog grooming) he cam with a backlog that had already been prioritized (sometimes for the next 5 sprints!) and was willing and able to change the priorities according to the prices we gave each ticket. He also accepted the need for refactoring and purely technical work, so we didn't have to fight to get time to improve our code base along with our deliveries. This was relaxing and stimulating, as we knew that if we met deadlines we'd be given time to work on what we wanted to.

### Different folks, different strokes

Some people will be better at different things, so it's pointless to try to price stories and estimate velocity on an individual basis.

The typical example it a story that would cost 8 points for a junior team member, but 3 for a senior.

We might as well price stories on a consistent basis, eg. assuming an employee of average experience for the team, and the result will be smoothed over time.

### Virtuous feedback loop

The real point of the agile mindset is to create a positive feedback loop for the team:

- go fast by integrating feedback early and often to avoid wasting time going in the wrong direction
- improve code over time with refactoring and testing
- estimate accurately enough over a certain period of time (eg. 2 or 3 weeks) that we can commit to clients

All the tools (story points, sprints, velocity) are here to help measure and achieve this, they are not targets or KPIs in isolation.

### It's also technical

A few things go hand in hand with scrum to make the agile team work:

- Code review
- Automated code quality
  + formatting
  + type checking
  + programming style: patterns, composition, architecture...
  + benchmarking: CPU/memory profiling, SQL queries, simple benchmarks...
- Continuous integration
- Simple deployments

---

## 4. More reading

### Agile as Trauma

[Source](https://doriantaylor.com/agile-as-trauma)

*While the Agile era has brought about remarkable advancements in project management techniques and development tools, it remains a tactical, technical, and ultimately reactionary movement. As long as Agile remains in this position it will be liable to backfire, vulnerable to the very depredations of bad management it had initially evolved to counter.*

*A development paradigm that can be construed from the outside as setting great store by speed—or, I suppose, velocity—is invariably going to be under continuous political and economic pressure to accelerate.*

### Scrum is fragile, not Agile

[Source](http://www.dennisweyland.net/blog/?p=43)

[Hacker News](https://news.ycombinator.com/item?id=20017854)

*What does it mean, if a large number of intelligent software developers are not able to implement Scrum correctly?*

*It means the whole framework is fragile.*

### Work is Work

[Source](https://codahale.com//work-is-work/)

*Prioritize the development of force multipliers*

*If an organization is largely working on the same types of problems it was in previous years, it’s cause for concern. Teams dedicated to internal tooling should be staffed and given the explicit direction of building tools and optimizing processes to help increase their co-workers’ productivity.*

### 12 Signs You’re Working in a Feature Factory

[Source](https://cutle.fish/blog/12-signs-youre-working-in-a-feature-factory)

It's worth reading the explanation given for each sign. They are:

1. No measurement
2. Rapid shuffling of teams and projects (aka Team Tetris)
3. Success theater around “shipping” with little discussion about impact
4. Infrequent (acknowledged) failures and scrapped work
5. No connection to core metrics
6. No PM retrospectives
7. Obsessing about prioritization
8. No tweaking
9. Culture of hand-offs
10. Large batches
11. Chasing upfront revenue
12. Shiny objects

[Follow-up](https://amplitude.com/blog/12-signs-youre-working-in-a-feature-factory-3-years-later)

Some time later, lessons learned. Again, worth reading each paragraph. The list:

1. It Takes Practice
2. Best Intentions
3. Starting Together
4. When the House is Burning
5. Focus on Learning
6. Coherence Without Oversimplification
7. Chipping Away
8. Lower WIP…Please
9. Prescriptive Bets and Coherence
10. Decision Reviews Take Dedication
11. Accidentally Over-Constraining Teams
12. Learn By Doing