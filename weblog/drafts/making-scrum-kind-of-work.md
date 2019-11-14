# Making scrum kind of work

Key points:
- Estimates aren't exact
- Velocity isn't constant
- Product owner is critical
- Different folks, different strokes
- Virtuous feedback loop
- It's also technical

## Estimates aren't exact

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

## Velocity isn't constant

What's interesting is not the velocity at the end of a sprint, it's the trend we can observe over time.
A team can gain or lose members, unexpected issues can disturb a sprint or two.
The team can also decide to price stories differently over time as they get more comfortable with their perimeter.
It can be a red flag if the `velocity/nb team members` decreases over time, it's probably a good thing if it increases, but it's not in itself a useful metric:
it has to be used in conjunction with the context of the team.
In the team mentioned above, after a few months we changed our baseline from 5 points to 3, as we were able to deliver faster thanks to:
1. deeper knowledge of our (legacy) code base
2. improved automated testing
3. more consistent coding standards thanks to code review

## Product owner is critical

## Different folks, different strokes

Some people will be better at different things, so it's pointless to try to price stories and estimate velocity on an individual basis.
The typical example it a story that would cost 8 points for a junior team member, but 3 for a senior.
We might as well price stories on a consistent basis, eg. assuming an employee of average experience for the team, and the result will be smoothed over time.

## Virtuous feedback loop

The real point of the agile mindset is to create a positive feedback loop for the team:
- go fast by integrating feedback early and often to avoid wasting time going in the wrong direction
- improve code over time with refactoring and testing
- estimate accurately enough over a certain period of time (eg. 2 or 3 weeks) that we can commit to clients

All the tools (story points, sprints, velocity) are here to help measure and achieve this, they are not targets or KPIs in isolation.

## It's also technical

A few things go hand in hand with scrum to make the agile team work:

- Code review
- Automated code quality
  + formatting
  + type checking
  + programming style: patterns, composition, architecture...
  + benchmarking: CPU/memory profiling, SQL queries, simple benchmarks...
- Continuous integration
- Simple deployments
