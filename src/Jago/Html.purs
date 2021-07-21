-- | This module contains the intermediate generalized representation for
-- | HTML and functions that is able to construct an HTML document from
-- | the representation.
module Jago.Html
       ( HtmlAttribute
       , Html
       , compileDocument
       ) where

import Prelude

import Data.Foldable (class Foldable, foldr, intercalate)

-- | Representation of an HTML attribute
data HtmlAttribute = HtmlAttribute String String

-- | Representation of a HTML tag or a text literal
data Html = HtmlTag String (Array HtmlAttribute) (Array Html)
          | HtmlLiteral String

-- | Fold a list using the monoid
mconcat :: forall f a. (Foldable f) => (Semigroup a) => (Monoid a) => f a -> a
mconcat = foldr append mempty

-- | Compile HtmlAttribute representation to HTML attribute
compileAttribute :: HtmlAttribute -> String
compileAttribute (HtmlAttribute k v) = mconcat [k, "=", "\"", v, "\""]

-- | Compile an array of HtmlAttribute representations to HTML attributes
compileAttributes :: Array HtmlAttribute -> String
compileAttributes = intercalate " " <<< map compileAttribute

-- | Compile a Html representation to HTML
compileHtml :: Html -> String
compileHtml (HtmlLiteral s) = s
compileHtml (HtmlTag tagName attrs child) = mconcat [start, child', end]
  where start = case attrs of
          [] -> mconcat ["<", tagName, ">"]
          xs -> mconcat ["<", tagName, " ", compileAttributes xs, ">"]
        end = mconcat ["</", tagName, ">"]
        child' = mconcat $ map compileHtml child

-- | Compile a Html document representation to HTML
compileDocument :: Array Html -> String
compileDocument doc = mconcat [doc', "\n"]
  where doc' = mconcat $ map compileHtml doc
