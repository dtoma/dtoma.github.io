> zaphar 11 hours ago [-]
> I was around for the Google Webserver rewrite and it was actually a rewrite done by refactoring not clean slate. It's amazing what you can do with disciplined refactoring, even moving to a new language.

> majormajor 5 hours ago [-]
> Yeah, if you don't have a detailed test suite, and can't build one, you probably don't fully understand your requirements, and your rewrite is in trouble already.

	
> hinkley 6 hours ago [-]
> I think this is the siren song of putting a clever architectural decision front-and-center in the code.
> "Everything is an X."
> What happens when it turns out not everything should be an X, or worse, X ends up being harmful? How do you refactor such a system when the biggest mistake is pervasive?
> [Edit: I have done it 2-3 times, but I'm not entirely sure I could adequately explain how I did it, which means I should still be asking that question.]

> darau1 6 hours ago [-]
> I rewrote two applications, once on my own, once with some help from the team. The first time we switched the backend to a completely new framework (I'm in the middle of one of those right now...) and the second time we upgraded from an outdated version of the framework to the latest one in one go (so, essentially a rewrite from the ground up).
> Both times sucked, both times we underestimated the amount of work to be done, and both times we were much happier with the new product than what we had before.

https://medium.com/@herbcaudill/lessons-from-6-software-rewrite-stories-635e4c8f7c22

> hnick 2 hours ago [-]
> I saw a link here on HN a short while ago (though I can't remember where exactly) to a Ribbon Farm post talking about Legibility, or the idea that people generally like things that can be understood and categorised.
> https://www.ribbonfarm.com/2010/07/26/a-big-little-idea-call...
> It seems to capture the idea of The Grand Rewrite fairly well. From the post:
>  - Look at a complex and confusing reality, such as the social dynamics of an old city
>  - Fail to understand all the subtleties of how the complex reality works
>  - Attribute that failure to the irrationality of what you are looking at, rather than your own limitations
>  - Come up with an idealized blank-slate vision of what that reality ought to look like
>  - Argue that the relative simplicity and platonic orderliness of the vision represents rationality
>  - Use authoritarian power to impose that vision, by demolishing the old reality if necessary
>  - Watch your rational Utopia fail horribly
> There are often good technical reasons for a rewrite or major refactoring, but more than once in my career the urge was definitely based on the fact that if we rewrite it then we will know it inside out and we will only have what we need, nothing more. Full control and understanding.

https://martinfowler.com/bliki/OpportunisticRefactoring.html

https://martinfowler.com/bliki/StranglerFigApplication.html

https://paulhammant.com/2013/07/14/legacy-application-strangulation-case-studies/



> I'm wary of any development practices that cause friction for opportunistic refactoring such as strong CodeOwnership or using a FeatureBranch. This is actually my primary concern with using feature branching . Often when people are working with feature branches, they are discouraged from opportunistic refactoring because it makes merges more difficult [1] - particularly if the branches live longer than a couple of days.

# Taylorism vs Agile

https://en.wikipedia.org/wiki/Goodhart%27s_law

# Git flow

https://trunkbaseddevelopment.com/

https://nvie.com/posts/a-successful-git-branching-model/

https://danielkummer.github.io/git-flow-cheatsheet/