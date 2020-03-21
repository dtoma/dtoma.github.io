# Taylorism mascarading as Agile

First, some definitions.

## Taylorism

[Wikipedia](https://en.wikipedia.org/wiki/Scientific_management)

> Scientific management is a theory of management that analyzes and synthesizes workflows. Its main objective is improving economic efficiency, especially labor productivity. It was one of the earliest attempts to apply science to the engineering of processes and to management. Scientific management is sometimes known as Taylorism after its founder, Frederick Winslow Taylor.

Simply put, the idea is to turn a worker into a cog part of an optimized process. The worker doesn't need to think, they just need to execute perfectly what management has thought for them. This is very useful when working on a repeatable industrial process, but terribly inefficient when responding to regular changes and new problems.

## Agile

> Individuals and interactions over processes and tools
>
> Working software over comprehensive documentation
>
> Customer collaboration over contract negotiation
>
> Responding to change over following a plan

Full of good intentions, the problem with Agile is its vague definition. Everyone has a personal interpretation of what Agile means. In reality, few companies that say they are Agile, really are.

## Scrum

[Scrum.org](https://www.scrum.org/resources/what-is-scrum)

> The Scrum Events
>
> Prescribed events are used in Scrum to create regularity and to minimize the need for meetings not defined in Scrum. All events are time-boxed. Once a Sprint begins, its duration is fixed and cannot be shortened or lengthened. The remaining events may end whenever the purpose of the event is achieved, ensuring an appropriate amount of time is spent without allowing waste in the process.  The Scrum Events are:
>
> - Sprint
> - Sprint Planning
> - Daily Scrum
> - Sprint Review
> - Sprint Retrospective

> Scrum Artifacts
>
> Scrum’s artifacts represent work or value to provide transparency and opportunities for inspection and adaptation. Artifacts defined by Scrum are specifically designed to maximize transparency of key information so that everybody has the same understanding of the artifact. The Scrum Artifacts are:
>
> - Product Backlog
> - Sprint Backlog
> - Increment

See also [the Scrum Guide](https://www.scrumguides.org/scrum-guide.html.), concepts of Product Owners, Scrum Masters, etc.

All in all, Scrum to me is a template of how to start turning a team into something vaguely agile, while still being close enough in structure to what big organizations expect. It's a way to convince managers to let the team start taking ownership of how they are managed.

It is paradoxical to follow an "Agile process" when the Agile Manifesto specifically mentions "Individuals and interactions over processes and tools". This is why I believe Scrum should be seen as a stepping stone, not an end goal.

## When Scrum is used to hide Taylorism

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

>  In an attempt to maximize velocity, a team may in fact achieve the opposite. If asked to maximize velocity, a team may skimp on unit or acceptance testing, reduce customer collaboration, skip fixing bugs, minimize refactoring, or many other key benefits of the various agile development practices. While potentially offering short-term improvement (if you can call it that), there will be a negative long-term impact. The goal is not maximized velocity, but rather optimal velocity over time, which takes into account many factors including the quality of the end product.

[visual-paradigm.com](https://www.visual-paradigm.com/scrum/what-is-scrum-velocity/)

> In Scrum, velocity help you to understand how long it will take your team to complete the product backlog. However, it typically takes few sprints for the team figure out a more stable velocity. To estimate more accurate velocity for your team, we can gain the experience based on the past track-record of the team. It will be more accurately forecasting of how many stories a Team can do in a Sprint. For forecasting purposes the average of the last three or four Sprint’s Velocity should be used.

[Scrum.org blog](https://www.scrum.org/resources/blog/agile-metrics-velocity)

> The Ugly: When Leadership decides to use improvement in Velocity as a measure to gauge Development Teams’ performance and teams become aware about it, things become ugly. Now Development Teams will start fudging the sizes of their PBI’s / tasks to ‘bloat’ their velocity, just to ensure they appear to meet (may be even beat) their target velocity. At this point transparency will cease to exist in the team ensuring mechanical Scrum implementation resulting in sub-optimal metrics and delivery.

[Scrum.org blog](https://www.scrum.org/resources/blog/moving-beyond-velocity)

> I once worked at a company where a yearly performance objective was set by a management team:
> Every developer will increase their individual contributions towards the team's velocity by x%, measured on a quarterly basis.
> Even though the managers had good intentions, as you can imagine, there wasn't much collaboration going on within those Scrum Teams, as there was no incentive to help out a teammate. I'm also sure story point inflation was rampant, with developers inflating their estimates to provide a safety gap. It's just human nature, which is actually backed by a theory called Goodhart's Law, which states:

[Agile alliance](https://www.agilealliance.org/glossary/velocity/#q=~(infinite~false~filters~(postType~(~'page~'post~'aa_book~'aa_event_session~'aa_experience_report~'aa_glossary~'aa_research_paper~'aa_video)~tags~(~'velocity))~searchTerm~'~sort~false~sortDirection~'asc~page~1))

> only the aggregate velocity of the team matters, and the phrase “individual velocity” is meaningless; a team is a mechanism intended to yield more than the sum of its individual parts

[Sealights.io](https://www.sealights.io/sprint-velocity/scrum-velocity-5-things-that-can-go-wrong/)

> Antipattern #1: Setting Targets for Velocity
> Antipattern #2: Expecting Instantaneous Maximum Velocity
> Antipattern #3: Work Not Broken Down into Granular Pieces
> Antipattern #4: No Slack
> Antipattern #5: Testing, Technical Debt and Known Bugs

In conclusion, good team velocity is a consequence of doing thing well, not an objective by itself.

## More reading

### Agile as Trauma

[Source](https://doriantaylor.com/agile-as-trauma)

> While the Agile era has brought about remarkable advancements in project management techniques and development tools, it remains a tactical, technical, and ultimately reactionary movement. As long as Agile remains in this position it will be liable to backfire, vulnerable to the very depredations of bad management it had initially evolved to counter.

> A development paradigm that can be construed from the outside as setting great store by speed—or, I suppose, velocity—is invariably going to be under continuous political and economic pressure to accelerate.

### Scrum is fragile, not Agile

[Source](http://www.dennisweyland.net/blog/?p=43)

[Hacker News](https://news.ycombinator.com/item?id=20017854)

> What does it mean, if a large number of intelligent software developers are not able to implement Scrum correctly?
> It means the whole framework is fragile.

### Work is Work

[Source](https://codahale.com//work-is-work/)

> Prioritize the development of force multipliers

> If an organization is largely working on the same types of problems it was in previous years, it’s cause for concern. Teams dedicated to internal tooling should be staffed and given the explicit direction of building tools and optimizing processes to help increase their co-workers’ productivity.