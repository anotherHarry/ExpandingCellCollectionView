# ExpandingCellCollectionView

A collectionView with scrolling creating a parallax effect.<br />
I achieve this by using a custom UICollectionViewLayout class for the collectionView.<br />
The most important thing to do is to update cell's UICollectionViewLayoutAttributes's frame in:

```swift
func prepare() {
  /* Update cell's UICollectionViewLayoutAttributes's frame here */
}
```

## Demo

* ### Expanding cell effect

<img src="./Demo/expandingcell.gif" width="400">


* ### Support Pull to Refresh

<img src="./Demo/pulltorefresh.gif" width="400">


* ### Infinite Scroll

<img src="./Demo/infinitescroll.gif" width="400">
