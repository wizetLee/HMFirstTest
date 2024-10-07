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


    // 初始化数据源。
    for (let i = 0; i < 10; i++) {
      this.arr.push(i)
    }

    // 自定义尺寸
    // 前2个item的主轴大小不是默认大小100，因此需要通过ChildrenMainSize通知List。
    this.listChildrenSize.splice(0, 2, [300, 300])

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


  // listScroller: ListScroller = new ListScroller()
  // scroller: Scroller = new Scroller()
  @State lazyList: LazyDataSource<ListModel> = new LazyDataSource([]);
  private arr: number[] = []
  private scroller: ListScroller = new ListScroller()
  @State listSpace: number = 10
  @State listChildrenSize: ChildrenMainSize = new ChildrenMainSize(100)

  build() {
    Column() {
      List({
        // space:
        // initialIndex:
        //         scroller:

      }) {
        ListItemGroup({
          space: 5,
          // header:
          // footer:
        }) {
          ListItem()
            .height(101)
            .width(`100%`)
            .backgroundColor(Color.Orange)
        }

        ListItemGroup() {
          ListItem()
            .height(101)
            .width(`100%`)
            .backgroundColor(Color.Blue)
            // .editable() // editMode属性设置为true（从API9开始无需设置editMode属性）。
            // .enabled()
            // .selectable()
        }
      }
      // .onItemMove()
      // .onItemDrop()
      .edgeEffect(EdgeEffect.Spring, {
        alwaysEnabled: true,
      })

      // List({ space: this.listSpace, initialIndex: 4, scroller: this.scroller }) {
      //   ForEach(this.arr, (item: number) => {
      //     ListItem() {
      //       Text('item-' + item)
      //         .height( item < 2 ? 300 : this.listChildrenSize.childDefaultSize)
      //         .width('90%')
      //         .fontSize(16)
      //         .textAlign(TextAlign.Center)
      //         .borderRadius(10)
      //         .backgroundColor(0xFFFFFF)
      //     }
      //     .selected(true)
      //   }, (item: string) => item)
      // }
      // .backgroundColor(Color.Gray)
      // .layoutWeight(1)
      // .scrollBar(BarState.On)
      // .childrenMainSize(this.listChildrenSize)
      // .alignListItem(ListItemAlign.Center)
      Row() {
        Button() {
          Text('item size + 50')
        }.onClick(() => {
          this.listChildrenSize.childDefaultSize += 50
        }).height('50%').width('30%')

        Button() {
          Text('item size - 50')
        }.onClick(() => {
          if (this.listChildrenSize.childDefaultSize === 0) {
            return
          }
          this.listChildrenSize.childDefaultSize -= 50
        }).height('50%').width('30%')

        Button() {
          Text('scrollTo (0, 310)')
        }.onClick(() => {
          // 310: 跳转到item 1顶部与List顶部平齐的位置。
          // 如果不设置childrenMainSize，item高度不一致时scrollTo会不准确。
          this.scroller.scrollTo({ xOffset: 0, yOffset: 310, animation: true })
        }).height('50%').width('30%')
      }.height('10%')
    }
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