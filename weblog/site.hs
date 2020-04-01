--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import qualified GHC.IO.Encoding as E
import           Text.Pandoc.Options            ( WriterOptions
                                                , writerNumberSections
                                                , writerTOCDepth
                                                , writerTableOfContents
                                                , writerTemplate
                                                )
--------------------------------------------------------------------------------
main :: IO ()
main = do
    E.setLocaleEncoding E.utf8
    hakyll $ do
        match "images/*" $ do
            route   idRoute
            compile copyFileCompiler

        match "css/*" $ do
            route   idRoute
            compile compressCssCompiler

        match (fromList ["about.rst", "contact.markdown"]) $ do
            route   $ setExtension "html"
            compile $ pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

        match "posts/*" $ do
            route $ setExtension "html"
            compile postCompiler

        create ["archive.html"] $ do
            route idRoute
            compile $ do
                posts <- recentFirst =<< loadAll "posts/*"
                let archiveCtx =
                        listField "posts" postCtx (return posts) `mappend`
                        constField "title" "Archives"            `mappend`
                        defaultContext

                makeItem ""
                    >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                    >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                    >>= relativizeUrls

        match "index.html" $ do
            route idRoute
            compile $ do
                posts <- recentFirst =<< loadAll "posts/*"
                let indexCtx =
                        listField "posts" postCtx (return posts) `mappend`
                        constField "title" "Home"                `mappend`
                        defaultContext

                getResourceBody
                    >>= applyAsTemplate indexCtx
                    >>= loadAndApplyTemplate "templates/default.html" indexCtx
                    >>= relativizeUrls

        match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

postCompiler :: Compiler (Item String)
postCompiler = do
   ident <- getUnderlying
   toc   <- getMetadataField ident "withtoc"
   let writerSettings = case toc of
        Just _ ->  withToc
        Nothing     -> defaultHakyllWriterOptions
   pandocCompilerWith defaultHakyllReaderOptions writerSettings
              >>= loadAndApplyTemplate "templates/post.html"    postCtx
              >>= loadAndApplyTemplate "templates/default.html" postCtx
              >>= relativizeUrls

withToc :: WriterOptions
withToc = defaultHakyllWriterOptions
        { writerTableOfContents = True
        , writerTOCDepth = 3
        , writerTemplate = Just "<div class=\"toc\">\n$toc$\n</div>\n$body$"
        -- , writerTemplate = Just "\n<div class=\"toc\"><div class=\"header\">Contents</div>\n$toc$\n</div>\n$body$"
        }