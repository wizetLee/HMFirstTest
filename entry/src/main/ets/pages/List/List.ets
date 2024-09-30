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


  listScroller: ListScroller = new ListScroller()
  scroller: Scroller = new Scroller()
  @State lazyList: LazyDataSource<ListModel> = new LazyDataSource([]);

  @State arr: string[] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"]
  @State alignListItem: ListItemAlign = ListItemAlign.Start

  build() {
    Column() {
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: string, index) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height((index % 2 + 1) * 20)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .border({ width: 2, color: Color.Green })
        }, (item: string) => item)
      }
      .height(300)
      .width("90%")
      .border({ width: 3, color: Color.Red })
      .lanes({ minLength: 50, maxLength: 50 })
      .alignListItem(this.alignListItem)
      .scrollBar(BarState.Off)

      Button("点击更改alignListItem:" + this.alignListItem).onClick(() => {
        if (this.alignListItem == ListItemAlign.Start) {
          this.alignListItem = ListItemAlign.Center
        } else if (this.alignListItem == ListItemAlign.Center) {
          this.alignListItem = ListItemAlign.End
        } else {
          this.alignListItem = ListItemAlign.Start
        }
      })
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
  }

  @Builder
  temp() {
    List({
      space: 10,
      // initialIndex: 10,
      // scroller
    }) {
      // ListItem()
      ListItemGroup()
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

    .nestedScroll({
      //设置向前向后两个方向上的嵌套滚动模式，实现与父组件的滚动联动。
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

    .onScrollIndex((start: number, end: number, center: number) => {

    })
    .onReachStart(() => {
      //列表到达起始位置时触发。
      //List初始化时如果initialIndex为0会触发一次，List滚动到起始位置时触发一次。
    })
    .onReachEnd(() => {
      // 列表到底末尾位置时触发。
      // List边缘效果为弹簧效果时，划动经过末尾位置时触发一次，回弹回末尾位置时再触发一次。
    })

    // .onScrollVisibleContentChange()

  }
}

class ListModel {
}