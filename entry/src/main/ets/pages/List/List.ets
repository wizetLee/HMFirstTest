import { LazyDataSource } from '../../tool/LazyDataSource'

@Entry({ routeName: "ListPage" })
@Component
struct ListPage {
  componentName = "ListPage"

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)
  }

  onPageHide(): void {
    console.log(`${this.componentName} - onPageHide`)
  }

  //Component 生命周期
  aboutToAppear(): void {
    console.log(`${this.componentName} - aboutToAppear`)
  }

  aboutToDisappear(): void {
    console.log(`${this.componentName} - aboutToDisappear`)
  }

  // aboutToReuse(params: { [key: string]: Any }): void {
  // }

  aboutToRecycle(): void {
    console.log(`${this.componentName} - aboutToRecycle`)
  }

  // List: 该组件内容区小于一屏时，默认没有回弹效果。需要回弹效果，可以通过edgeEffect属性的options参数进行设置
  // List的子组件只能使用ListItem \ListItemGroup
  // 支持（if/else、ForEach、LazyForEach和Repeat）


  scroller: Scroller = new Scroller()
  @State lazyList: LazyDataSource<ListModel> = new LazyDataSource([]);

  build() {
    Column() {
      List({
        space: 10,
        // initialIndex: 10,
        // scroller
      }) {
        // ListItem()
        // ListItemGroup()
        LazyForEach(this.lazyList, () => {
          // ListItem()
        })
      }
      //.listDirection(Axis.Horizontal)
      .width("100%")
      .height("100%")
      .divider({
        strokeWidth: 1,
        color: Color.Red,
      })
      .scrollBar(BarState.On)
      //.cachedCount(10)
      // .edgeEffect(EdgeEffect.Spring
      //   , {
      //     alwaysEnabled: false
      //   })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {

        // return {
        //   offsetRemain: 100
        // }
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {

      })

      .nestedScroll({ //设置向前向后两个方向上的嵌套滚动模式，实现与父组件的滚动联动。
          scrollForward: NestedScrollMode.SELF_FIRST, // 滚动组件往末尾端滚动时的嵌套滚动选项。
          scrollBackward: NestedScrollMode.SELF_FIRST, // 滚动组件往起始端滚动时的嵌套滚动选项。
      })
      .childrenMainSize(new ChildrenMainSize(44)) // 子组件在主轴方向的默认大小。
      .lanes(1, 10) // 设置List组件的布局列数或行数。gutter为列间距，当列数大于1时生效。
      // .scrollSnapAlign() // 设置列表项滚动结束对齐效果。
      // .enableScrollInteraction()
      // .friction() 摩擦系数

      // 上下间隙控制
      //.contentStartOffset()
      //.contentEndOffset()

      
    }
  }
}

class ListModel {
}